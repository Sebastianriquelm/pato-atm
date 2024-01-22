import { useState } from 'react'
import { URL } from '../../App'
import TextInputLabel from '../TextInputLabel/TextInputLabel'
import styles from './AtmIdAndLocation.module.css'

export default function AtmIdAndLocation(props) {
  const {id_atm,  handleInputChange, auditorname, direccion, ciudad, nombre_cliente, region, setForm, form} = props
  const [disabledInput, setDisabledInput] = useState(false)


  
  const getAtmLocation = async () => {
    if (!form.id_atm) return
    try {
      const responseUser = await fetch(`${URL}/user`)
      const { auditorname } = await responseUser.json()
  

      const response = await fetch(`${URL}/atm_validation/${id_atm}`)
      
      const { ciudad, direccion, nombre_cliente, region } = await response.json()
      console.log(auditorname, direccion, ciudad, nombre_cliente, region);
      if (direccion) {
        setForm(prev => ({...prev,auditorname: auditorname, direccion: direccion, ciudad: ciudad, nombre_cliente: nombre_cliente, region: region}))
        setDisabledInput(true)
      } else {
        setDisabledInput(false)
        setForm(prev => ({...prev, auditorname: '', direccion: '', ciudad: '', nombre_cliente: '', region: ''}))
      }
    } catch (error) {
      console.error(error);
    }
  }
  return (
    <>
      <div className='itemContainer'>              
        <TextInputLabel
          title='N° de cajero:'
          required={true}
          name='id_atm'
          type="number"
          value={id_atm}
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
          value={auditorname}
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
          value={direccion}
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
          value={ciudad}
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
          value={nombre_cliente}
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
          value={region}
          handleChange={handleInputChange}
          isDisabled={disabledInput ? 'yes' : 'no'}
        />
      </div>
     
    </>
  )
}