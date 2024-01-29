import { useState } from 'react'
import { URL } from '../../App'
import TextInputLabel from '../TextInputLabel/TextInputLabel'
import styles from './AtmIdAndLocation.module.css'
import SelectInputLabel from '../SelectInputLabel/SelectInputLabel'

export default function AtmIdAndLocation(props) {
  const {id_atm,  handleInputChange, auditorname, direccion, ciudad, nombre_cliente, region, setForm, form} = props
  const [disabledInput, setDisabledInput] = useState(false)


  
  const getAtmLocation = async () => {
    if (!form.id_atm) return;
  
    try {
      /*
      // Paso 1: Obtén información del usuario
      const responseUser = await fetch(`${URL}/user`);
  
      // Manejo de errores para la solicitud del usuario
      if (!responseUser.ok) {
        throw new Error(`Error al obtener información del usuario. Código de estado: ${responseUser.status}`);
      }
  
      const userResponse = await responseUser.json();
      const auditorname = userResponse.auditorname || '';*/
  
      // Paso 2: Obtén información del cajero automático
      const response = await fetch(`${URL}/atm_validation/${form.id_atm}`);
  
      // Manejo de errores para la segunda solicitud
      if (!response.ok) {
        throw new Error(`Error al obtener información del cajero automático. Código de estado: ${response.status}`);
      }
  
      const { ciudad, direccion, nombre_cliente, region } = await response.json();
  
      console.log(auditorname, direccion, ciudad, nombre_cliente, region);
  
      // Actualiza el estado del formulario
      if (direccion) {
        setForm((prev) => ({ ...prev, auditorname, direccion, ciudad, nombre_cliente, region }));
        setDisabledInput(true);
      } else {
        setDisabledInput(false);
        setForm((prev) => ({ ...prev, auditorname: '', direccion: '', ciudad: '', nombre_cliente: '', region: '' }));
      }
    } catch (error) {
      console.error(error);
    }
  };
  
  return (
    <>
      <div className='itemContainer'>              
        <TextInputLabel
          title='N° de cajero:'
          required={true}
          name='id_atm'
          type="number"
          value={form.id_atm}
          handleChange={handleInputChange}
        />
        <button className={styles.button} type='button' onClick={getAtmLocation}>Validar N° cajero</button>
      </div>
      <div className='itemContainer'>              
        <TextInputLabel
          title='Nombre Auditor'
          required={true}
          name='auditorname'
          type="text"
          value={form.auditorname}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
      <div className='itemContainer'>
        <TextInputLabel
          title='Dirección ATM'
          required={true}
          name='direccion'
          type="text"
          value={form.direccion}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
      <div className='itemContainer'>
        <TextInputLabel
          title='Ciudad'
          required={true}
          name='ciudad'
          type="text"
          value={form.ciudad}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
      <div className='itemContainer'>
        <TextInputLabel
          title='Nombre cliente'
          required={true}
          name='nombre_cliente'
          type="text"
          value={form.nombre_cliente}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
      <div className='itemContainer'>
        <TextInputLabel
          title='Region'
          required={true}
          name='region'
          type="text"
          value={form.region}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
     
    </>
  )
}