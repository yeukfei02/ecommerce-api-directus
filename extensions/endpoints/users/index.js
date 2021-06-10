const bcrypt = require("bcryptjs");
const dayjs = require("dayjs");
const { v4: uuidv4 } = require("uuid");
const jwt = require("jsonwebtoken");

module.exports = function registerEndpoint(router, { services }) {
  const { ItemsService } = services;

  router.post("/signup", async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    try {
      const usersService = new ItemsService("users", {
        schema: req.schema,
        accountability: req.accountability,
      });
      await usersService.knex("users").insert({
        email: email,
        password: bcrypt.hashSync(password),
        created_at: dayjs(new Date()),
        updated_at: dayjs(new Date()),
      });
    } catch (e) {
      console.log("error = ", e);
    }

    res.status(200).json({
      message: "signup",
    });
  });

  router.post("/login", async (req, res) => {
    let response = {};

    const email = req.body.email;
    const password = req.body.password;

    try {
      const usersService = new ItemsService("users", {
        schema: req.schema,
        accountability: req.accountability,
      });
      const usersFromDBList = await usersService
        .knex("users")
        .where("email", email);
      const usersFromDB = usersFromDBList[0];
      if (usersFromDB) {
        const userPassword = usersFromDB.password;
        const isPasswordValid = bcrypt.compareSync(password, userPassword);
        if (isPasswordValid) {
          const token = jwt.sign(
            {
              id: uuidv4(),
              email: email,
            },
            process.env.JWT_SECRET,
            { expiresIn: 60 * 60 }
          );
          response = res.status(200).json({
            message: "login",
            token: token,
          });
        } else {
          response = res.status(400).json({
            message: "login error, wrong password",
          });
        }
      }
    } catch (e) {
      console.log("error = ", e);
    }

    return response;
  });

  router.put("/change-password/:id", async (req, res) => {
    let response = {};

    const id = req.params.id;
    const oldPassword = req.body.old_password;
    const newPassword = req.body.new_password;

    try {
      const usersService = new ItemsService("users", {
        schema: req.schema,
        accountability: req.accountability,
      });
      const userList = await usersService.knex("users").where("id", id);
      if (userList) {
        const userFromDB = userList[0];
        const hashPasswordFromDB = userFromDB.password;
        if (bcrypt.compareSync(oldPassword, hashPasswordFromDB)) {
          const hashPassword = bcrypt.hashSync(newPassword);
          await usersService
            .knex("users")
            .where("id", id)
            .update({ password: hashPassword });

          response = res.status(200).json({
            message: "changePassword",
          });
        } else {
          response = res.status(400).json({
            message: "changePassword error, oldPassword is not correct",
          });
        }
      }
    } catch (e) {
      console.log("error = ", e);
    }

    return response;
  });
};
