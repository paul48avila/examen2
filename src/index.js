import { PrismaClient } from "@prisma/client";
import express from "express";

const prisma = new PrismaClient();

const app = express();
app.use(express.json());


//aqui van los metodos de la api para el crud de productos


//get all productos
app.get("/producto", async (req, res) => {
    const productos = await prisma.producto.findMany();
    res.json(productos);
});

//get producto by codigo
app.get("/producto/:codigo", async (req, res) => {
    const { codigo } = req.params;
    const producto = await prisma.producto.findUnique({
        where: {
            codigo,
        },  
    });
    res.json(producto);
});

//post producto
app.post("/producto", async (req, res) => {
    const producto = await prisma.producto.create({
        data: {
            nombre: req.body.nombre, 
            codigo: req.body.codigo,
            precio: req.body.precio,
            cantidad: req.body.cantidad,
            cantidad_en_almacen: req.body.cantidad_en_almacen,
            categoria: req.body.categoria,
            descripcion: req.body.descripcion,

        },
    });
    console.log(" producto creado");
    res.json(producto);
});

//put producto
app.put("/producto/:id", async (req, res) => {
    const { id } = req.params;
    const producto = await prisma.producto.update({
        where: {
            id: Number(id),
        },
        data: {
            nombre: req.body.nombre,
            codigo: req.body.codigo,
            precio: req.body.precio,
            cantidad: req.body.cantidad,
            cantidad_en_almacen: req.body.cantidad_en_almacen,
            categoria: req.body.categoria,
            descripcion: req.body.descripcion,
        },
    });
    res.json(producto);
});

//delete producto
app.delete("/producto/:id", async (req, res) => {
    const { id } = req.params;
    const producto = await prisma.producto.delete({
        where: {
            id: Number(id),
        },
    });
    res.json(producto);
});

//metodos para el crud de ventas

//post venta
app.post("/venta", async (req, res) => {
    const venta = await prisma.venta.create({
        data: {
          nombre_Producto: req.body.nombre_Producto,
          codigo_Producto: req.body.codigo_Producto,  
          cantidad_facturados_Producto: req.body.cantidad_facturados_Producto,
          precio_Producto: req.body.precio_Producto,
          codigo_unico_de_venta: req.body.codigo_unico_de_venta,
          total: req.body.total,
          nombre_cliente: req.body.nombre_cliente,
          telefono_de_tienda: req.body.telefono_de_tienda,
          direccion: req.body.direccion,
          productoId: req.body.productoId,  
        },
    });
    console.log(" venta creada");
    res.json(venta);
});
 
//get all ventas    
app.get("/venta", async (req, res) => {
    const ventas = await prisma.venta.findMany({include: {autor: true}});
    res.json(ventas);
});

//get venta by codigo_unico_de_venta 

app.get("/venta/:codigo_unico_de_venta", async (req, res) => {
    const { codigo_unico_de_venta } = req.params;
    const venta = await prisma.venta.findUnique({include: {autor: true},
        
        where: {
            codigo_unico_de_venta,
        },
    });
    res.json(venta);
});

//patch venta con mensaje que diga que las ventas no se pueden actualzar




//eliminar venta por codigo_Producto
app.delete("/venta/:codigo_Producto", async (req, res) => {
    const { codigo_Producto } = req.params;
    const venta = await prisma.venta.delete({   
        where: {
            codigo_Producto: String(codigo_Producto),   
        },
    });
    res.json(venta);
});

//no se pueden actualizar las ventas







app.use((req, res, next) => {

    res.status(404);

    return res.json({

      success: false,

      payload: null,

      message: `API SAYS: Endpoint not found for path: ${req.path}`,

  });

});

 

  app.listen(process.env.PORT || 8000, () =>

    console.log(`🚀 Example app listening on port 8000`)

);