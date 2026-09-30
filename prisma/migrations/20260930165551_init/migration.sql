-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Evento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "local" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "palestrante_id" INTEGER NOT NULL
);
INSERT INTO "new_Evento" ("data", "descricao", "id", "local", "nome", "palestrante_id") SELECT "data", "descricao", "id", "local", "nome", "palestrante_id" FROM "Evento";
DROP TABLE "Evento";
ALTER TABLE "new_Evento" RENAME TO "Evento";
CREATE TABLE "new_Palestrante" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "evento_id" INTEGER,
    CONSTRAINT "Palestrante_evento_id_fkey" FOREIGN KEY ("evento_id") REFERENCES "Evento" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Palestrante" ("email", "evento_id", "id", "nome") SELECT "email", "evento_id", "id", "nome" FROM "Palestrante";
DROP TABLE "Palestrante";
ALTER TABLE "new_Palestrante" RENAME TO "Palestrante";
CREATE UNIQUE INDEX "Palestrante_email_key" ON "Palestrante"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
