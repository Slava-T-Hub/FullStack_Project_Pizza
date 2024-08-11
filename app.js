const express = require("express");
const app = express();
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
//==========
const secretKey = 'mykey';
//==========
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
//==========
//=======================================================
//=======================================================
const getAllOrdersRouter = require("./router/getAllOrders-router");
app.use("/", getAllOrdersRouter);
//=======================================================
const getOrderDetailsRouter = require('./router/getOrderDetailsByCustomerId-Router');
app.use('/api', getOrderDetailsRouter);
//=======================================================
const deleteOrderRouter = require('./router/deleteOrderById-router');
app.use('/api', deleteOrderRouter);
//=======================================================
const getAllpizzaDescriptionRouter = require("./router/getAllPizzaDetails-router");
app.use("/", getAllpizzaDescriptionRouter);
//==================
const getAllExtraDescriptionRouter = require("./router/getAllExtraDescription-router");
app.use("/", getAllExtraDescriptionRouter);
//==================
const getAlldrinkDescriptionRouter = require("./router/getAlldrinkDescription-router");
app.use("/", getAlldrinkDescriptionRouter);
//=======================================================
const postOrderRouter = require("./router/postOrder-Router");
app.use("/", postOrderRouter);
//===============================================================================LOGIN===
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  if (username === 'Slava' && password === 'key1234') {
      const token = jwt.sign({ username }, secretKey, { expiresIn: '1h' });
      res.cookie('token', token, { httpOnly: true });
      res.redirect('/admin.html');
  } else {
      res.status(401).send('Invalid credentials');
    }
});
app.get('/admin.html', (req, res) => {
  const token = req.cookies.token;
  if (!token) {
      return res.redirect('/');
    }
  jwt.verify(token, secretKey, (err, decoded) => {
      if (err) {
          return res.redirect('/');
      }
      res.sendFile(__dirname + '/public/admin.html');
    });
});
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});
//=======================================================
//=======================================================
app.use(express.static("public"));
//================================
const PORT = 3010;
//================================
app.listen(PORT, () => {
  console.log(`Server is connect to ${PORT}`);
});
