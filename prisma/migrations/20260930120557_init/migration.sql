/*
  Warnings:

  - You are about to drop the `_EventoToPalestrante` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `evento_id` to the `Palestrante` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "_EventoToPalestrante_B_index";

-- DropIndex
DROP INDEX "_EventoToPalestrante_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_EventoToPalestrante";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Evento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "local" TEXT NOT NULL,
    "data" TEXT NOT NULL
);
INSERT INTO "new_Evento" ("data", "descricao", "id", "local", "nome") SELECT "data", "descricao", "id", "local", "nome" FROM "Evento";
DROP TABLE "Evento";
ALTER TABLE "new_Evento" RENAME TO "Evento";
CREATE TABLE "new_Palestrante" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "evento_id" INTEGER NOT NULL,
    CONSTRAINT "Palestrante_evento_id_fkey" FOREIGN KEY ("evento_id") REFERENCES "Evento" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Palestrante" ("email", "id", "nome") SELECT "email", "id", "nome" FROM "Palestrante";
DROP TABLE "Palestrante";
ALTER TABLE "new_Palestrante" RENAME TO "Palestrante";
CREATE UNIQUE INDEX "Palestrante_email_key" ON "Palestrante"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
