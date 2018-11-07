# Informes para estudios de gastroenterología

Es un sistema de informes de **endoscopía** y **colonoscopia**. Se guardan los pacientes con su historial de informes.

La sesión es a traves de redes sociales será en una proxima versión.

Una vista previa del sistema
https://snag.gy/vf2wPd.jpg



#### Dependencias externas

* Vagrant

En el caso que no se use vagrant para levantarlo sino local

* Node.js
* MySQL

## Instalación local

Recomendación: Descargar vagrat desde la página del proveedor.

**Instalar dependencias**

`sudo apt install npm nodejs mysql-client mysql-server libmysqlclient-dev libsqlite3-dev vagrant`

**Instalar Ruby**

* (Linux) `apt-get install ruby`
* (Windows) http://rubyinstaller.org/downloads/ (version Ruby 2.0.0-p647 si es Windows XP)

**Instalar Bundler**
* `gem install bundler`

**Clonar o descargar el repositorio**

`git clone https://github.com/NatiiDC/informes-gastro.git`

**Ejecutar**

`bundle install`

`bundle update`

## Ejecución

  Creación de la BD: `bundle exec rake db:create`

  Migraciones: `bundle exec rake db:migrate`

  Datos de prueba: `bundle exec rake db:setup`

  Levantar la virtual: `vagrant up`

## Mode production

[Provisioning de la VM y deployment con Capistrano](https://github.com/NatiiDC/informes-gastro/blob/master/Provisioning%20de%20la%20VM%20y%20deployment%20con%20Capistrano.md)

utils:

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
