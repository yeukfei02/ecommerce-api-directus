const bcrypt = require("bcryptjs");
const dayjs = require("dayjs");
const { v4: uuidv4 } = require("uuid");
const jwt = require("jsonwebtoken");
const { Directus } = require("@directus/sdk");

const directus = new Directus("https://ecommerce-api-directus.herokuapp.com");
const users = directus.items("users");

module.exports = function registerEndpoint(router) {
  router.post("/signup", async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    try {
      await directus.auth.login({
        email: process.env.ADMIN_USERNAME,
        password: process.env.ADMIN_PASSWORD,
      });
      await users.createOne({
        email: email,
        password: bcrypt.hashSync(password),
        created_at: dayjs(),
        updated_at: dayjs(),
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
      await directus.auth.login({
        email: process.env.ADMIN_USERNAME,
        password: process.env.ADMIN_PASSWORD,
      });
      const usersFromDBList = await users.readMany({
        filter: {
          email: {
            _eq: email,
          },
        },
      });
      if (usersFromDBList) {
        const usersFromDB = usersFromDBList.data[0];
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
              { expiresIn: "1d" }
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
      await directus.auth.login({
        email: process.env.ADMIN_USERNAME,
        password: process.env.ADMIN_PASSWORD,
      });
      const userFromDB = await users.readOne(id);
      if (userFromDB) {
        const hashPasswordFromDB = userFromDB.password;
        if (bcrypt.compareSync(oldPassword, hashPasswordFromDB)) {
          const hashPassword = bcrypt.hashSync(newPassword);
          await users.updateOne(id, { password: hashPassword });

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
