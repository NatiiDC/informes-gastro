Este Pull Request actualiza (y limpia) la configuración de preparación (_provisioning_) de la VM para correr en producción, instalando correctamente y de manera desatendida todas las dependencias para ejecutar la aplicación.
# TL;DR

La primera vez ejecutar:

``` console
# Borrar la VM existente, si existiera
$ vagrant destroy -f
# Crear y configurar la VM
$ vagrant up
```

Y el resto de las veces:

``` console
# Levantar la VM si estuviera apagada
$ vagrant up
# Realizar deployment con Capistrano
$ bundle exec cap production deploy
```
# Preparación (la primera vez)

Estos pasos se deben ejecutar sólo la primera vez que se va a hacer el deployment de la aplicación, ubicada en el directorio base del proyecto en la máquina host.

``` console
# Borrar la VM existente, si existiera
$ vagrant destroy -f
# Crear y configurar la VM
$ vagrant up
```

Los pasos anteriores dejan la máquina preparada para realizar los _deployments_ de la aplicación. Estos pasos se deberían ejecutar únicamente la primera vez que se vaya a preparar todo (por el borrado de la VM existente).
# Inicio de la VM

Estos pasos deben realizarse luego de cualquier reinicio de la computadora. Son para que comience la VM luego de que se haya apagado.

``` console
# Iniciar (levantar) la VM
$ vagrant up
```
# Reconfiguración de la VM

Si por algún motivo se necesita volver a configurar la VM, se puede ejecutar:

``` console
# Configurar la VM existente
$ vagrant provision
```

> Nota: Recordá cambiar el `set :branch` en `config/deploy.rb` si dejás de usar la rama `mode-production`.
# Deployment

Este proceso despliega la aplicación en la máquina de destino (la VM en este caso) acorde a la configuración planteada en `config/deploy/production.rb`:

``` console
$ bundle exec cap production deploy
```

Esto utiliza Capistrano y se encarga de todas las tareas necesarias para crear/actualizar la aplicación en la máquina de destino e iniciar el servicio de Upstart para la aplicación. Este comando se debe correr cada vez que se quiera actualizar la aplicación.
# Acceso

Luego de todo, la aplicación queda escuchando en el puerto `3000` de la VM (que tiene configurada la IP `10.10.10.10`), por lo que se puede acceder mediante: http://10.10.10.10:3000. Si se quiere configurar un hostname en la máquina host, se puede hacer en el archivo dedicado a esto según correpsonda al Sistema Operativo que esté corriendo.

![Screenshot](https://www.dropbox.com/s/he7ugrsynhiub39/Screenshot%202016-03-03%2015.09.18.png?dl=1)
