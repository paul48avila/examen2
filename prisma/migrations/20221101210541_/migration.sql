/*
  Warnings:

  - You are about to drop the column `autorId` on the `venta` table. All the data in the column will be lost.
  - Added the required column `productoId` to the `venta` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "venta" DROP CONSTRAINT "venta_autorId_fkey";

-- AlterTable
ALTER TABLE "venta" DROP COLUMN "autorId",
ADD COLUMN     "productoId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "venta" ADD CONSTRAINT "venta_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES "producto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
