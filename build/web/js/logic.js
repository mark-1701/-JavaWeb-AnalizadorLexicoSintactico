
/* Leer y mostrar contenido inmediatamente */

function mostrarContenido(contenido) {
    const elemento = document.getElementById('contenido-archivo');
    elemento.innerHTML = contenido;
}

function leerArchivo(e) {
    const archivo = e.target.files[0];
    if (!archivo) {
        return;
    }
    const lector = new FileReader();
    lector.onload = function (e) {
        const contenido = e.target.result;
        mostrarContenido(contenido);
    };
    lector.readAsText(archivo);
}

document.querySelector('#load').addEventListener('change', leerArchivo, false);

const textarea = document.querySelector('textarea')
/*
const lineNumbers = document.querySelector('.line-numbers')

textarea.addEventListener('keyup', event => {
    const numberOfLines = event.target.value.split('\n').length

    lineNumbers.innerHTML = Array(numberOfLines)
        .fill('<span></span>')
        .join('')
})*/

textarea.addEventListener('keydown', event => {
    if (event.key === 'Tab') {
        const start = textarea.selectionStart
        const end = textarea.selectionEnd

        textarea.value = textarea.value.substring(0, start) + '\t' + textarea.value.substring(end)

        event.preventDefault()
    }
})


