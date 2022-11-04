-- CreateTable
CREATE TABLE "producto" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "cantidad" DOUBLE PRECISION NOT NULL,
    "cantidad_en_almacen" DOUBLE PRECISION NOT NULL,
    "categoria" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "producto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "venta" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "cantidad_facturados" INTEGER NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "codigo_unico_de_venta" TEXT NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "nombre_cliente" TEXT NOT NULL,
    "telefono_de_tienda" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "autorId" INTEGER NOT NULL,

    CONSTRAINT "venta_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "producto_codigo_key" ON "producto"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "venta_codigo_key" ON "venta"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "venta_codigo_unico_de_venta_key" ON "venta"("codigo_unico_de_venta");

-- CreateIndex
CREATE UNIQUE INDEX "venta_telefono_de_tienda_key" ON "venta"("telefono_de_tienda");

-- CreateIndex
CREATE UNIQUE INDEX "venta_direccion_key" ON "venta"("direccion");

-- AddForeignKey
ALTER TABLE "venta" ADD CONSTRAINT "venta_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "producto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
