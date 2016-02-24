# Informes para estudios de gastroenterología

Es un sistema de informes de **endoscopía** y **colonoscopia**. Se guardan los pacientes con su historial de informes. La sesión es a traves de redes sociales.

Todavía está en desarrollo el sistema

## Instalación

Instalar Ruby

* (Linux) `apt-get install ruby`
* (Windows) http://rubyinstaller.org/downloads/ (version Ruby 2.0.0-p647 si es Windows XP)

Instalar Bundler
* `gem install bundler`

Clonar o descargar el repositorio

Ejecutar `bundle install`


## Ejecución

  Migraciones: `bundle exec rake db:migrate`
  
  Datos de prueba: `bundle exec rake db:setup`
