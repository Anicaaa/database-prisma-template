-- CreateTable
CREATE TABLE "_StudentToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_StudentToTag_AB_unique" ON "_StudentToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_StudentToTag_B_index" ON "_StudentToTag"("B");

-- AddForeignKey
ALTER TABLE "_StudentToTag" ADD CONSTRAINT "_StudentToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_StudentToTag" ADD CONSTRAINT "_StudentToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
