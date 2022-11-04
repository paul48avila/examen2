/*
  Warnings:

  - You are about to drop the column `cantidad_facturados` on the `venta` table. All the data in the column will be lost.
  - You are about to drop the column `codigo` on the `venta` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `venta` table. All the data in the column will be lost.
  - You are about to drop the column `precio` on the `venta` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[codigo_Producto]` on the table `venta` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cantidad_facturados_Producto` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `codigo_Producto` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre_Producto` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio_Producto` to the `venta` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "venta" DROP CONSTRAINT "venta_autorId_fkey";

-- DropIndex
DROP INDEX "venta_codigo_key";

-- AlterTable
ALTER TABLE "venta" DROP COLUMN "cantidad_facturados",
DROP COLUMN "codigo",
DROP COLUMN "nombre",
DROP COLUMN "precio",
ADD COLUMN     "cantidad_facturados_Producto" INTEGER NOT NULL,
ADD COLUMN     "codigo_Producto" TEXT NOT NULL,
ADD COLUMN     "nombre_Producto" TEXT NOT NULL,
ADD COLUMN     "precio_Producto" DOUBLE PRECISION NOT NULL,
ALTER COLUMN "fecha" DROP NOT NULL,
ALTER COLUMN "fecha" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "autorId" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "venta_codigo_Producto_key" ON "venta"("codigo_Producto");

-- AddForeignKey
ALTER TABLE "venta" ADD CONSTRAINT "venta_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "producto"("id") ON DELETE SET NULL ON UPDATE CASCADE;
