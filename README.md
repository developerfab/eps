# EPS

Este es un proyecto desarrollado en ruby on rails para el manejo y administracion de la informacion de una eps, utilizando los estandares propuestos por la HL7

## Registro de usuario (PETICION POST)
Parametros:
```
{ email: "example@email.com", password: "password", password_confirmation: "password"}
```
Dirección:
```
http://direccion_ip/api/v1/auth/
```
## Inicio de sesion (PETICION POST)

Parametros:
```
{ email: "example@email.com", password: "password"}
```
Dirección:
```
http://direccion_ip/api/v1/auth/sign_in
```
