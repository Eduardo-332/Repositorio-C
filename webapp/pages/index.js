<<<<<<< HEAD
// pages/index.js
import Head from "next/head";
import { useState } from "react";

export default function Home() {
  const [mensaje, setMensaje] = useState("");

  const mostrarMensaje = () => {
    setMensaje("¡Hola! Bienvenido a la WebApp.");
  };

  return (
    <>
      <Head>
        <title>Mi WebApp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charSet="UTF-8" />
        <link rel="stylesheet" href="/styles.css" />
      </Head>
      <body>
        <header>
          <h1>Bienvenido a Mi WebApp</h1>
        </header>
        <main>
          <p>Esta es una aplicación web simple desplegada en Azure.</p>
          <button onClick={mostrarMensaje}>Haz clic aquí</button>
          <p>{mensaje}</p>
        </main>
      </body>
    </>
  );
}
=======
// pages/index.js
import Head from "next/head";
import { useState } from "react";

export default function Home() {
  const [mensaje, setMensaje] = useState("");

  const mostrarMensaje = () => {
    setMensaje("¡Hola! Bienvenido a la WebApp.");
  };

  return (
    <>
      <Head>
        <title>Mi WebApp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charSet="UTF-8" />
        <link rel="stylesheet" href="/styles.css" />
      </Head>
      <body>
        <header>
          <h1>Bienvenido a Mi WebApp</h1>
        </header>
        <main>
          <p>Esta es una aplicación web simple desplegada en Azure.</p>
          <button onClick={mostrarMensaje}>Haz clic aquí</button>
          <p>{mensaje}</p>
        </main>
      </body>
    </>
  );
}
>>>>>>> c7e48c785bcd28275d01abce8905cb7023fbca54
