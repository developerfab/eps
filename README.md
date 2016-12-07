# EPS

Este es un proyecto desarrollado en ruby on rails para el manejo y administracion de la informacion de una eps, utilizando los estandares propuestos por la HL7

## Registro de usuario paciente (PETICION POST)
Parametros:
```
{ email: email, password: password, password_confirmation: password_confirmation, document: document, name: name, last_name: last_name, gender: gender, birthdate: birthdate, phone: phone)
```
Dirección:
```
http://direccion_ip/api/v1/auth/
```
## Registro de usuario doctor(PETICION POST)
Parametros:
```
{ 
  email: "doctor@email.com",
  password: "12345678",
  password_confirmation: "12345678",
  document: "321321",
  type: "doctor",
  speciality: "GENERAL",
  medical_license: "123321",
  schedule: "7 AM - 4 PM",
  worked_days: [ "LUNES", "MIERCOLES", "VIERNES"]
}
```
Dirección:
```
http://direccion_ip/api/v1/auth/
```
## Registro de usuario administrador(PETICION POST)
Parametros:
```
{
  email: "doctor@email.com",
  password: "12345678",
  password_confirmation: "12345678",
  document: "321321",
  type: "admin"
}
```
Dirección:
```
http://direccion_ip/api/v1/auth/
```
## Registro de usuario funcionario(PETICION POST)
Parametros:
```
{
  email: "doctor@email.com",
  password: "12345678",
  password_confirmation: "12345678",
  document: "321321",
  type: "functionary"
}
```
Dirección:
```
http://direccion_ip/api/v1/auth/
```
## Inicio de sesion (PETICION POST)

Parametros:
```
{
  email: "example@email.com",
  password: "password"
}
```
Dirección:
```
http://direccion_ip/api/v1/auth/sign_in
```

## Pedir cita(PETICION POST)
### Se debe estar logeado para esta peticion
```
{
  patient_id: patient_id,
  doctor_id: doctor_id,⋅
  date_cite: "2016-12-12 10:00",
  authorized: boolean(true o false)
}
```
Dirección:
```
http://direccion_ip/api/v1/cites
```
## Crear servicio
```
params = { 
  name: "FONOAUDIOLOGIA" 
}
```
Dirección:
```
http://direccion_ip/api/v1/services
```
