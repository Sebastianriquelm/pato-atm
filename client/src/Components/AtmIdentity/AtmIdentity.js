import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Compressor from 'compressorjs';

import { URL } from '../../App';

import Header from '../Header/Header';
import TextInputLabel from '../TextInputLabel/TextInputLabel';
import SubmitButton from '../SubmitButton/SubmitButton';
import CheckboxInputLabel from '../CheckboxInputLabel/CheckboxInputLabel';
import SelectInputLabel from '../SelectInputLabel/SelectInputLabel';
import FileInputLabel from '../FileInputLabel/FileInputLabel';
import AtmIdAndLocation from '../AtmIdAndLocation/AtmIdAndLocation';

import styles from './AtmIdentity.module.css'

import exist from '../../Assets/Images/icons/BTN_SALIR.png'
import WaitingAndResolve from '../WaitingAndResolve/WaitingAndResolve';

export default function AtmIdentity(props) {
  const [disabledInput, setDisabledInput] = useState(false)
  const [form, setForm] = useState({
    id_atm: '',
    //id : randomCode,
    auditorname: '',
    direccion:'',  
    ciudad:'', 
    nombre_cliente:'', 
    region:'',
    photo1: null,
    photo2: null,
    photo3: null,
    estado_atm: 'Seleccione'
  });
  const [submitStatus, setSubmitStatus] = useState('');

  const handleInputChange = event => {
    const target = event.target;
    const name = target.name;
    if (target.type === 'file') {
      const value = target.files[0]
      new Compressor(value, {
        quality: 0.1,
        success(result) {
          setForm(prev => ({ ...prev, [name]: result }))
        },
        error(err) {
          console.error(err.message);
        },
      });
    }
    else {
      const value = target.type === 'checkbox' ? target.checked : target.value;
      setForm(prev => ({ ...prev, [name]: value }));
    }
  }

  const onSubmitForm = async e => {
    e.preventDefault()
    const formData = new FormData()
    Object.entries(form).forEach(data => {
      const key = data[0]
      const value = data[1]
      formData.append(key, value)
    })
    try {
      setSubmitStatus('loading')
      const response = await fetch(`${URL}/atm-identity`, {
        method: 'post',
        body: formData
      })

      if (response.ok) setSubmitStatus('success')
      else setSubmitStatus('error')
    } catch (error) {
      console.error('error', error);
      setSubmitStatus('error')
    }
  }

  
  return (
    <>
      <Header />
      {
        submitStatus ?
          <WaitingAndResolve status={submitStatus} handleStatus={setSubmitStatus} /> :
          <>
            <form className='form' onSubmit={onSubmitForm}>
              <AtmIdAndLocation
                id_atm={form.atmId}
                auditorname={form.auditorname}
                direccion={form.direccion}
                ciudad={form.ciudad}
                nombre_cliente={form.nombre_cliente}
                region={form.region}
                handleInputChange={handleInputChange}
                setForm={setForm}
                form={form}
              />              
          
              <p style={{ marginBottom: 13 }}>Fotos Obligatorias:</p>
              <div className='itemContainer'>
                <p style={{ marginBottom: 13 }}>Foto exterior ATM:</p>
                <FileInputLabel
                  required={true}
                  handleChange={handleInputChange}
                  name="photo1"
                  photoFile={form.photo1}
                />
                </div>

                <div className='itemContainer'>
                <p style={{ marginBottom: 13 }}>Estado general del espacio donde esta ubicado el ATM:</p>
                <FileInputLabel
                  required={true}
                  handleChange={handleInputChange}
                  name="photo2"
                  photoFile={form.photo2}
                />
                </div>
                 <div className='itemContainer'>
                {/*
                <p style={{ marginBottom: 13 }}>Estado general de ATM:</p>
                <SelectInputLabel
                  required={true}
                  handleChange={handleInputChange}
                  name="estado_atm"
                  options={["Activo", "Sin dinero", "Fuera de servicio"]}
                  value={form.estado_atm || 'Seleccione'}
                  
                /> */}
                <p style={{ marginBottom: 13 }}>Fotografía Estado</p>
                <FileInputLabel
                  required={false}
                  handleChange={handleInputChange}
                  name="photo3"
                  photoFile={form.photo3}
                  isDisabled={form.estado_atm === 'Activo' ? 'yes' : 'no'}
                />
                </div>
                     
              <SubmitButton />
            </form>
            <Link to='/' className={styles.existBtnRight}>
              <img className={styles.imgWidth} src={exist} alt='exist' />
            </Link>
          </>
      }
    </>
  );
}
