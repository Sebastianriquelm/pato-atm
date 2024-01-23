import { useState } from "react"
import { URL } from "../../App"

import styles from '../GetServiceData/GetServiceData.module.css'

export default function GetTableData(props) {
  const {dates, atmId, serviceType} = props

  const [data, setData] = useState('')
  const [serviceData, setServiceData] = useState(null)
  const [photoFiles, setPhotoFiles] = useState([])

  const handleChange = event => {
    const { value } = event.target
    setData(value)
  }

  const handleSubmit = event => {
    event.preventDefault()
    fetch(`${URL}/api/get-service-data/${atmId}/${data}/${serviceType}`)
      .then(response => response.json())
      .then(json => {
      setServiceData(Object.entries(json[0]))
        setPhotoFiles(json[1])
      })
      .catch(error => {
        console.error(error)
      })
  }

  const handleImgError = event => {
    event.target.style.display = 'none'
  }

  const tableRows = (dataType, data) => {
    const dataTypeToClient = {
      //atm_site
      'id_atm': 'ATM ID',
      'fecha': 'Fecha Auditoria',
      'auditorname': 'Nombre Auditor',
      'control_acceso': 'Estado acceso al cajero',
      'control_acceso_op': 'Control Acceeso operativo',
      'conexion_visible': 'Conexión eléctrica visibles',
      'estado_gral_espacio': 'Estado donde se ubica ATM',
      'estado_paredes': 'Estado de las paredes',
      'estado_puerta': 'Estado de las puertas',
      'estado_cielo': 'Estado del cielo',
      'estado_ac': 'Estado Aire acondicionado',
      'estado_iluminaria': 'Estado luminaria',
      'estado_muebles': 'Estado muebles',
      'estado_camaras': 'Estado general Camaras de monitoreo',
      //physical_at,
      'estado_pantalla': 'Estado pantalla ATM',
      'teclado_pantalla': 'Teclado ATM cumple estandares',
      'teclado_dano': 'Teclado ATM presenta daños',
      'cubre_teclado': 'Cuenta con cubre teclado',
      'impresion': 'ATM imprime comprobante legible',
      'basurero': 'Cuenta con Basurero',
      'presentacion': 'Presentacion general ATM es optima',
      //atm_signage
      'ad_visa': 'Adhesivo visa es legible',
      'ad_visa_diseno': 'Adhesivo visa cumple diseño actual',
      'ad_ubicacion': 'Adhesivo visa cumple ubicacion según manual',
      'ad_mc': 'Adhesivo mastercard es legible',
      'ad_mc_diseno': 'Adhesivo mastercard cumple diseño actual',
      'ad_mc_ubicacion': 'Adhesivo mastercard cumple ubicacion según manual',
      'numero_atm': 'Numero de ATM es visible',
      'sen_seg': 'Señalizacion de medidas de seguridad',
      'sen_seg_diseno': 'Señalizacion de medidas de seguridad cumple estandares segun manual actual',
      'redbanc': 'Cuenta con huincha redbanc',
      'redbanc_ubicacion': 'Huincha redbanc cumple ubicacion según manual',
      'redbanc_largo': 'Huincha redbanc cumple norma de longitud segun manual',
      'redbanc_diseno': 'Huincha redbanc cumple con diseño actual',
      'grafica_atm': 'Gráfica lateral ATM (Publicidad) posee logo o huincha redbanc',
      'grafica_piso': 'Grafica de piso cumple norma grafica',
      //exterior_signage
      'puerta': 'Estado Señaletica exterior redbanc (Puertas)',
      'muro': 'Estado señaletica exterior (Paleta muro)',
      'ad_visa': 'Estado señaletica exterior autoadhesivos de logo o huincha en ventanas y puertas ',
      'ad_mc': 'Señaletica Exterior autoadhesivos de logo o huincha en ventanas y puertas cumple lo establecido en manual'

    }
    const booleanStringFormat = bool => bool ? 'Optimo' : 'Deficiente'
    return (
      <tr key={dataType}>
          <td>{dataTypeToClient[dataType] || dataType}</td>
          <td className="text-end">{typeof data === 'boolean' ? booleanStringFormat(data) : data}</td>
      </tr>
    )
    
  }
  
  const getPhotoRouteByCoincidence = photoNumber => `/Images/${photoFiles.find(photo => photo.includes(photoNumber))}`
  //console.log(photoNumber);
  return (
    <>
      <h5 style={{textAlign: 'center'}}>Escoge la fecha del servicio</h5>
      <form onSubmit={handleSubmit} className={`form ${styles.form}`} style={{display: "flex", flexDirection: "column", gap: 17}}>
        <label className={styles.label}>
          Fecha: {' '}
          <select onChange={handleChange} value={data} required>
            
            <option value='' disabled>Selecciona una fecha</option>
            {console.log(data)}
            {dates.map(date => <option key={date} value={date}>{date}</option>)}
          </select>
        </label>
        <button>Ver información</button>
      </form>
      { serviceData &&
        <>
          <table className="form">
            <thead>
              <tr>
                <th>Cuestionario ATM</th>
                <th>Estado ATM</th>
              </tr>
            </thead>
            <tbody>
              { serviceData.map(dataEntrie => tableRows(dataEntrie[0], dataEntrie[1])) }
            </tbody>
          </table>
          <div className={styles.imageContainer}>
          {serviceType === 'site' &&
            <>
              <h3>ATM Frontal</h3>
              <img src={getPhotoRouteByCoincidence('photo1.')} alt='Foto no encontrada'/>
              <h3>ATM Latera Derecho</h3>
              <img src={getPhotoRouteByCoincidence('photo2.')} alt='Foto no encontrada'/>
              <h3>ATM Latera Izquierdo</h3>
              <img src={getPhotoRouteByCoincidence('photo3.')} alt='Foto no encontrada'/>
              <h3>N° ATM </h3>
              <img src={getPhotoRouteByCoincidence('photo4.')} alt='Foto no encontrada'/>
              <h3>Estado del piso</h3>
              <img src={getPhotoRouteByCoincidence('photo5.')} alt='Foto no encontrada'/>
              <h3>Conexiones eléctricas</h3>
              <img src={getPhotoRouteByCoincidence('photo6.')} alt='Foto no encontrada'/>
            </>
          }
          </div>
        </>
      }
    </>
  )
}