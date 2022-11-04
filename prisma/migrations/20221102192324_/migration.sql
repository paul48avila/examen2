-- DropIndex
DROP INDEX "venta_direccion_key";

-- DropIndex
DROP INDEX "venta_telefono_de_tienda_key";

-- AlterTable
ALTER TABLE "venta" ALTER COLUMN "telefono_de_tienda" SET DEFAULT '85296549',
ALTER COLUMN "direccion" SET DEFAULT 'Calle flores, El Roble';
