-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "fen" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Move" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "notation" TEXT NOT NULL,
    "fenAfter" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "playerId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Move_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Move_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Player" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Stats" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "wins" INTEGER NOT NULL DEFAULT 0,
    "losses" INTEGER NOT NULL DEFAULT 0,
    "draws" INTEGER NOT NULL DEFAULT 0,
    "playerId" TEXT NOT NULL,
    CONSTRAINT "Stats_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Matchmaking" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "player1Id" TEXT NOT NULL,
    "player2Id" TEXT,
    "gameId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL,
    CONSTRAINT "Matchmaking_player1Id_fkey" FOREIGN KEY ("player1Id") REFERENCES "Player" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Matchmaking_player2Id_fkey" FOREIGN KEY ("player2Id") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Matchmaking_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_GamePlayers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_GamePlayers_A_fkey" FOREIGN KEY ("A") REFERENCES "Game" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_GamePlayers_B_fkey" FOREIGN KEY ("B") REFERENCES "Player" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Player_username_key" ON "Player"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Stats_playerId_key" ON "Stats"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "_GamePlayers_AB_unique" ON "_GamePlayers"("A", "B");

-- CreateIndex
CREATE INDEX "_GamePlayers_B_index" ON "_GamePlayers"("B");
