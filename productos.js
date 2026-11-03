document.addEventListener("DOMContentLoaded", async () => {
    const contenedor =
    document.getElementById("lista-productos");
    
    if (!contenedor) return;
    
    const categoria = contenedor.dataset.categoria;
    
    try {
    const respuesta = await fetch(
    "productos_api.php?categoria=" +
    encodeURIComponent(categoria)
    );
    
    if (!respuesta.ok) {
    throw new Error("Error al consultar");
    }
    
    const productos = await respuesta.json();
    contenedor.textContent = "";
    
    if (productos.length === 0) {
    contenedor.textContent =
    "No hay productos disponibles.";
    return;
    }
    
    productos.forEach(producto => {
    const tarjeta = document.createElement("div");
    tarjeta.className = "producto";
    
    const nombre = document.createElement("h3");
    nombre.textContent = producto.nombre;
    
    const marca = document.createElement("p");
    marca.textContent = "Marca: " + producto.marca;
    
    const precio = document.createElement("p");
    precio.textContent =
    "Precio: $" + Number(producto.precio)
    .toFixed(2) + " MXN";
    
    const boton = document.createElement("button");
    boton.textContent = "Comprar";
    boton.addEventListener("click", () => {
    window.location.href =
    "tienda.php?producto=" +
    encodeURIComponent(producto.id);
    });
    
    tarjeta.append(nombre, marca, precio, boton);
    contenedor.appendChild(tarjeta);
    });
    
    } catch (error) {
    contenedor.textContent =
    "No se pudieron cargar los productos.";
    }
    });
    
    