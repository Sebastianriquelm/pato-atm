require('dotenv').config()

const express = require('express')
const cors = require('cors')
const multer = require('multer')
const path = require('path')
const { readdir } = require('fs/promises')
const mime = require('mime-types')
const pool = require('./db')
const crypto = require('crypto');
//const session = require('express-session')

const PORT = process.env.PORT || 3000
let globalCode = '';
// Función para generar un código alfanumérico aleatorio
function generateRandomCode(length) {
  return crypto.randomBytes(Math.ceil(length / 2))
    .toString('hex')
    .slice(0, length);
    
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './public/Images');
  },
  filename: (req, file, cb) => {
    const { id_atm } = req.body;

    // Genera un nuevo código aleatorio solo si no existe en la solicitud
    if (!req.globalCode) {
      req.globalCode = generateRandomCode(4);
      console.log("codigo asignado a la foto", req.globalCode);
    }
    const cod = req.globalCode;
   
    // Crea la cadena de fecha y hora
    const date = new Date();
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;
    
    // Usa cod en lugar de randomCode en la creación del nombre del archivo
    const fileImages = `./public/Images/-${cod}-${id_atm}-${fullDateString}-${file.fieldname}.${mime.extension(file.mimetype)}`;
    console.log("FileImages: ", fileImages);

    req.fileImages = fileImages;

    // Usa cod en lugar de randomCode en la devolución de llamada de multer
    cb(null, `${cod}-${id_atm}-${fullDateString}-${file.fieldname}.${mime.extension(file.mimetype)}`);
  }
});


const upload = multer({ storage })

const app = express()

// middlewares
app.use(cors())
app.use(express.json()) // req.body

// app.use(session({
//   secret: process.env.SESSION_SECRET,
//   resave: false,
//   credentials: 'true',
//   saveUninitialized: false,
//   cookie: {
//     secure: process.env.NODE_ENV === 'production',
//     httpOnly: true,
//     maxAge: 1000 * 60 * 60 * 24 * 1, // 1 day
//     sameSite: process.env.NODE_ENV === 'production' ? 'none' : 'lax',
//   }
// })
// );

const options = {
  dotfiles: 'ignore',
  etag: false,
  extensions: ['htm', 'html'],
  index: false,
  maxAge: '1d',
  redirect: false,
  setHeaders: function (res, path, stat) {
    res.set('x-timestamp', Date.now())
  }
}
app.use(express.static(path.join(__dirname, '../client/build')))
app.use(express.static('public', options))

// routes
// create services
//-----------------------
// corregir para validar
//-----------------------

app.get('/user', async (req, res) => {
  try {
    const query = `SELECT nombre || ' ' || apellido as auditorname FROM usuarios`
    const response = await pool.query(query);

    if(response.rows.length > 0) {
      res.json(response.rows[0])
      console.log(response.rows[0])
    } else {
      res.json({})
    }
  } catch (error) {
    console.error(error);
    res.sendStatus(500);
  }
})



app.get('/atm_validation/:id', async (req, res) => {
  const { id } = req.params;
  const selectQuery = `SELECT * from atm WHERE id_atm = ${id}`;
  
  try {
    const response = await pool.query(selectQuery);
    
    // Verifica si hay resultados
    if (response.rows.length > 0) {
      // Envía todos los datos de la fila como respuesta
      res.json(response.rows[0]);
    } else {
      res.json({}); // No se encontraron datos para el ID especificado
    }
  } catch (error) {
    console.error(error);
    res.sendStatus(500);
  }
});


const fieldsUploadsAtmsite = upload.fields([
  { name: 'photo1' },
  { name: 'photo2' },
  { name: 'photo3' },
  { name: 'photo4' },
  { name: 'photo5' },
  { name: 'photo6' },
]);

app.post('/atm-site', fieldsUploadsAtmsite, async (req, res) => {
  try {
    // Genera un nuevo código aleatorio para cada inserción
    const cod = req.globalCode;
    const date = new Date()
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    //const hours = date.getHours();
    /*const minutes = date.getMinutes();

    // Formatea los componentes de tiempo para tener dos dígitos (por ejemplo, 01 en lugar de 1)
    const formatedHours = formartNumber(hours);
    const formatedMinutes = formartNumber(minutes);*/
    // Crea la cadena de fecha y hora -- ${formatedHours}:${formatedMinutes} agregar eso si se quiere setear hr y min
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;

    const {
      id_atm,
      ATMaccesscontrol,
      OperationalAccessControl,
      ElectricalConnections,
      GeneralstatusATMspace,
      Statewalls,
      Doorstatus,
      Stateheavens,
      Airconditioningstatus,
      lightingstatus,
      Furniturecondition,
      Statemonitoringcameras
    } = req.body;

    console.log("Values to insert:", {
      id_atm,
      fullDateString,
      ATMaccesscontrol,
      OperationalAccessControl,
      ElectricalConnections,
      GeneralstatusATMspace,
      Statewalls,
      Doorstatus,
      Stateheavens,
      Airconditioningstatus,
      lightingstatus,
      Furniturecondition,
      Statemonitoringcameras,
      cod
    });

    if (!id_atm) {
      throw new Error("atmId is required");
    }

    const newAtmAtmsite = await pool.query(`
      INSERT INTO site (
        id_site,
        control_acceso,
        control_acceso_op,
        conexion_visible,
        estado_gral_espacio,
        estado_paredes,
        estado_puerta,
        estado_cielo,
        estado_ac,
        estado_iluminaria,
        estado_muebles,
        estado_camaras,
        fecha,
        cod)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);
    `, [id_atm,
      ATMaccesscontrol,
      OperationalAccessControl,
      ElectricalConnections,
      GeneralstatusATMspace,
      Statewalls,
      Doorstatus,
      Stateheavens,
      Airconditioningstatus,
      lightingstatus,
      Furniturecondition,
      Statemonitoringcameras,
      fullDateString,
      cod
    ]);

    res.json(newAtmAtmsite);
    console.log("insert", newAtmAtmsite);
  } catch (error) {
    console.error(error);
    res.sendStatus(500);
  }
});


const fieldsUploadsPhysicalAtm = upload.fields([
  { name: 'photo1' },
])
app.post('/Physical-Atm', fieldsUploadsPhysicalAtm, async (req, res) => {
  try {
    const date = new Date()
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    //const hours = date.getHours();
    /*const minutes = date.getMinutes();

    // Formatea los componentes de tiempo para tener dos dígitos (por ejemplo, 01 en lugar de 1)
    const formatedHours = formartNumber(hours);
    const formatedMinutes = formartNumber(minutes);*/
    // Crea la cadena de fecha y hora -- ${formatedHours}:${formatedMinutes} agregar eso si se quiere setear hr y min
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;
    const {
      id_atm,
      ATMscreenstatus,
      ATMKeyboardstatus,
      DamagedATMkeypads,
      keyboardcovers,
      legiblereceipt,
      ATMtrash,
      ATMpresentation
    } = req.body

    // Agrega logs para imprimir los valores que estás intentando insertar
    console.log("Values to insert:", {
      id_atm,
      fullDateString,
      ATMscreenstatus,
      ATMKeyboardstatus,
      DamagedATMkeypads,
      keyboardcovers,
      legiblereceipt,
      ATMtrash,
      ATMpresentation
    });

    // Validación de valores antes de la inserción
    if (!id_atm) {
      throw new Error("atmId is required");
    }
    /*day,
    auditorname,*/
    const newPhysicalAtm = await pool.query(`
      INSERT INTO fisico (
        id_fisico,
        estado_pantalla,
        teclado_pantalla,
        teclado_dano,
        cubre_teclado,
        impresion,
        basurero,
        presentacion,
        fecha
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    `, [
      id_atm,
      ATMscreenstatus,
      ATMKeyboardstatus,
      DamagedATMkeypads,
      keyboardcovers,
      legiblereceipt,
      ATMtrash,
      ATMpresentation,
      fullDateString
    ])

    res.json(newPhysicalAtm)
  } catch (error) {
    console.error(error)
    res.sendStatus(500)
  }
})

app.post('/atm-signage', fieldsUploadsPhysicalAtm, async (req, res) => {
  try {
    const date = new Date()
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    //const hours = date.getHours();
    /*const minutes = date.getMinutes();

    // Formatea los componentes de tiempo para tener dos dígitos (por ejemplo, 01 en lugar de 1)
    const formatedHours = formartNumber(hours);
    const formatedMinutes = formartNumber(minutes);*/
    // Crea la cadena de fecha y hora -- ${formatedHours}:${formatedMinutes} agregar eso si se quiere setear hr y min
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;
    const {
      id_atm,
      //day,
      //auditorname,
      VisaSticker,
      VisaAdhesivedesign,
      Visastickermeetslocation,
      Mastercardsticker,
      MastercardAdhesivedesign,
      Mastercardstickermeetslocation,
      VisibleATMNumber,
      AtmSafetySignage,
      AtmSafetyMeasuresSignageStopDisc,
      Redbanctape,
      Redbanctapelocation,
      redbanctapemeetslength,
      redbancribbonmeetsdesign,
      GraphiconthesideofAtm,
      floorchart
    } = req.body
    // Agrega logs para imprimir los valores que estás intentando insertar
    console.log("Values to insert:", {
      id_atm,
      VisaSticker,
      VisaAdhesivedesign,
      Visastickermeetslocation,
      Mastercardsticker,
      MastercardAdhesivedesign,
      Mastercardstickermeetslocation,
      VisibleATMNumber,
      AtmSafetySignage,
      AtmSafetyMeasuresSignageStopDisc,
      Redbanctape,
      Redbanctapelocation,
      redbanctapemeetslength,
      redbancribbonmeetsdesign,
      GraphiconthesideofAtm,
      floorchart,
      fullDateString
    });

    // Validación de valores antes de la inserción
    if (!id_atm) {
      throw new Error("atmId is required");
    }


    /*day,
    auditorname,*/
    const newAtmAtmSignage = await pool.query(`
      INSERT INTO senaletica (
        id_senaletica,
        ad_visa,
        ad_visa_diseno,
        ad_ubicacion,
        ad_mc,
        ad_mc_diseno,
        ad_mc_ubicacion,
        numero_atm,
        sen_seg,
        sen_seg_diseno,
        redbanc,
        redbanc_ubicacion,
        redbanc_diseno,
        grafica_atm,
        grafica_piso,
        redbanc_largo,
        fecha
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
    `, [
      id_atm,
      //day,
      //auditorname,
      VisaSticker,
      VisaAdhesivedesign,
      Visastickermeetslocation,
      Mastercardsticker,
      MastercardAdhesivedesign,
      Mastercardstickermeetslocation,
      VisibleATMNumber,
      AtmSafetySignage,
      AtmSafetyMeasuresSignageStopDisc,
      Redbanctape,
      Redbanctapelocation,
      redbanctapemeetslength,
      redbancribbonmeetsdesign,
      GraphiconthesideofAtm,
      floorchart,
      fullDateString
    ])

    res.json(newAtmAtmSignage)
  } catch (error) {
    console.error(error)
    res.sendStatus(500)
  }
})
const fieldsUploadsexteriorsignage = upload.fields([
  { name: 'photo1' },
])
app.post('/exterior-signage', fieldsUploadsexteriorsignage, async (req, res) => {
  try {
    const date = new Date()
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;
    const {
      id_atm,
      RedbancOutdoorSignage,
      Exteriorwallsignage,
      Exteriorsignageselfadhesivelogo,
      Exteriorsignageselfadhesivelogook

    } = req.body
    // Agrega logs para imprimir los valores que estás intentando insertar
    console.log("Values to insert:", {
      id_atm,
      RedbancOutdoorSignage,
      Exteriorwallsignage,
      Exteriorsignageselfadhesivelogo,
      Exteriorsignageselfadhesivelogook,
      fullDateString
    });

    // Validación de valores antes de la inserción
    if (!id_atm) {
      throw new Error("atmId is required");
    }
    const newAtmExteriorSignage = await pool.query(`
      INSERT INTO exterior (
        id_exterior,
        puerta,
        muro,
        ad_visa,
        ad_mc,
        fecha
      )
      VALUES ($1, $2, $3, $4, $5, $6)
      `,[  
      id_atm,
      RedbancOutdoorSignage,
      Exteriorwallsignage,
      Exteriorsignageselfadhesivelogo,
      Exteriorsignageselfadhesivelogook,
      fullDateString
    ])

    res.json(newAtmExteriorSignage)
  } catch (error) {
    console.error(error)
    res.sendStatus(500)
  }
})

const fieldsUploadsAtmidentity = upload.fields([
  { name: 'photo1' },
  { name: 'photo2' },
  { name: 'photo3' },

])
app.post('/atm-identity', fieldsUploadsAtmidentity, async (req, res) => {
  try {
    const date = new Date()
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    //const hours = date.getHours();
    /*const minutes = date.getMinutes();

    // Formatea los componentes de tiempo para tener dos dígitos (por ejemplo, 01 en lugar de 1)
    const formatedHours = formartNumber(hours);
    const formatedMinutes = formartNumber(minutes);*/
    const cod = req.globalCode;
    // Crea la cadena de fecha y hora -- ${formatedHours}:${formatedMinutes} agregar eso si se quiere setear hr y min
    const fullDateString = `${formartNumber(day)}-${formartNumber(month)}-${year}`;
    const {
      id_atm,
      auditorname,
      direccion,
      ciudad,
      nombre_cliente, 
      region
    } = req.body

    console.log("Datos a insertar", id_atm,cod,
      auditorname, fullDateString, direccion, ciudad,
      nombre_cliente,
      region
    );


    const newAtmAtmValidation = await pool.query(`
      INSERT INTO atm (
        id_atm,
        direccion,
        nombre_cliente,
        fecha_hora,
        nombre_auditor,
        estado_check,
        ciudad,
        region,
        cod
        )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
    `, [id_atm,
      direccion,
      nombre_cliente,
      fullDateString,
      auditorname,
      "Activo",
      ciudad,
      region,
      cod
    ])
    

    res.json(newAtmAtmValidation)
    console.log("insert", newAtmAtmValidation);

  } catch (error) {
    console.log("errorrr")
    console.error(error)
    res.sendStatus(500)
  }
})
app.get('/api/get-service-data/:atmId/:serviceType', (req, res) => {
  const { atmId, serviceType } = req.params;
  
  pool.query(`SELECT fecha FROM ${serviceType} WHERE id_atm = ${atmId}`)
    .then(serviceInfo => {
      //console.log(serviceInfo.rows,"aquiiiiii"); 
      res.json(serviceInfo.rows)})
    .catch(error => console.error(error))
})

app.get('/api/get-service-data/:atmId/:date/:serviceType', async (req, res) => {
  const { atmId, date, serviceType } = req.params
  const imagesFiles = await readdir('./public/Images')
  const filteredFiles = imagesFiles.filter(file => file.includes(`${atmId}-${date}`))
  pool.query(`SELECT * FROM ${serviceType} WHERE id_atm = ${atmId} AND fecha = '${date}'`)
    .then(serviceInfo => res.json([serviceInfo.rows[0], filteredFiles]))
    .catch(error => console.error(error))
})


app.listen(PORT, () => {
  console.log(`Server listening at ${PORT}`)
})

function formartNumber(number) {
  return `${number}`.padStart(2, '0')
}