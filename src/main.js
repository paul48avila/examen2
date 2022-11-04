import { PrismaClient } from "@prisma/client";



const prisma = new PrismaClient();



async function main() {

  const productosNuevos = await prisma.producto.create({

    data: {

        nombre: "Frijoles",  
        descripcion: "frijpoles de la mejor calidad",
        codigo: "1",
        precio : 1000,
        cantidad: 10,
        cantidad_en_almacen : 15,
        categoria: "granos",

    },

  });

  console.log("Se agrego un nuevo producto: ", productosNuevos);

  const todosproductos = await prisma.producto.findMany();

  console.log("A continuaccion la lista de productos: ");

  console.dir(todosproductos, { depth: null });

}



main()

  .catch((e) => {

    console.error(e);

    process.exit(1);

  })

  .finally(async () => {

    await prisma.$disconnect();

  });