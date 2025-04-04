// public/app.js
document.addEventListener("DOMContentLoaded", () => {
    const boton = document.getElementById("saludoBtn");
    const mensaje = document.getElementById("mensaje");

    if (boton && mensaje) {
        boton.addEventListener("click", () => {
            mensaje.textContent = "¡Hola! Bienvenido a la WebApp.";
        });
    }
});
