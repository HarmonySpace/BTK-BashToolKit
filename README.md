![Poster](./assets/img/logo_logo-icon-blue.png)
# BashToolKit
BashToolKit (BTK) es un un repositorio de herramientas de uso cotidiano para un usuario linux. Dichas herramientas tiene la intención de facilitar tareas cotidianas para los amantes de la terminal.

> [!WARNING]
> 
> Por el momento solo soportado para la paquetería apt (ubuntu y derivados).

## Dependencias

Es necesario instalar estos paquetes para el funcionamiento de los scripts.

- git
    
- gum shell (charm)
    
- xclip
## Instalación

La instalación debe ser de manera manual. Para ello se debe colocar la siguiente línea en el archivo de configuración de tu shell (zsh, bash).

```bash
export PATH="$HOME/$RutaDelProyecto/executable:$PATH"
```

Luego debemos recargar nuestra terminal. Podremos cerrarla o utilizar los comandos `source` para cargar el archivo de nuestra shell.

Para usuarios de bash:

```bash
source ~/.bashrc
```

Para usuarios de zsh:

```bash
source ~/.zshrc
```

## Uso

Una vez la terminal haya sido recargada, se puede mandar a llamar las funciones con el comando `mto`.

Y listo, ya solo accedes a la función de preferencia.
