const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  const studentA = await prisma.student.create({
    data: {
      name: "Anica",
      tags: {
        create: [{ content: "idyllic" }, { content: "fantastic" }],
      },
    },
    include: {
      tags: true,
    },
  });

  const studentB = await prisma.student.create({
    data: {
      name: "Bubu",
      tags: {
        connectOrCreate: {
          where: {
            content: "idyllic",
          },
          create: {
            content: "idyllic",
          },
        },
      },
    },
    include: {
      tags: true,
    },
  });

  console.log(studentA);
  console.log(studentB);

  process.exit(0);
}

seed()
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
  })
  .finally(() => process.exit(1));
