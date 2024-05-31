# Script de Configuración de Sistema

Este script de Bash proporciona varias funciones para la configuración y el mantenimiento del sistema Ubuntu. Puede realizar tareas como actualizar el sistema, activar el algoritmo de control de congestión BBR, cambiar el idioma del sistema a español, cambiar la zona horaria, cerrar el puerto RPC 111, deshabilitar el FirewallD de Oracle, entre otras.

## Funciones Disponibles

1. **Actualizar el sistema:** Actualiza el sistema operativo Ubuntu.
2. **Activar BBR:** Habilita el algoritmo de control de congestión BBR para mejorar el rendimiento de la red.
3. **Cambiar idioma Ubuntu:** Cambia el idioma del sistema a español.
4. **Cambiar zona horaria:** Establece la zona horaria del sistema a America/Bogota.
5. **Cerrar puerto RPC 111:** Deshabilita el servicio RPC en el puerto 111.
6. **Deshabilitar FirewallD Oracle:** Desactiva el FirewallD de Oracle y limpia las reglas de iptables.
7. **Mirar idioma actual:** Muestra el idioma actual configurado en el sistema.
8. **Mirar puertos activos:** Muestra los puertos en modo escucha en el sistema.
9. **Reparar log lleno:** Trunca el archivo de registro del sistema para liberar espacio.
10. **Salir:** Finaliza la ejecución del script.

## Uso

1. Clona este repositorio en tu máquina Ubuntu.
2. Ejecuta el script con permisos de superusuario:

```bash
sudo bash configuracion_sistema.sh
