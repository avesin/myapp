
# 📱 YouApp Flutter App — Fullstack Technical Test

This is a Flutter app that connects to a custom NestJS backend for authentication, profile management, messaging, and real-time chat. It is designed to work with your own backend hosted at:

🔗 **Backend GitHub**: [backend-myapp](https://github.com/avesin/backend-myapp/blob/main/README.md)

---

## 🚀 Backend Setup Instructions

Before running the Flutter app, make sure you have the backend server running.

### 1. Clone and Setup Backend

```bash
git clone https://github.com/avesin/backend-myapp.git
cd backend-myapp
```

### 2. Create a `.env` file

In the `backend-myapp/` folder, create a file named `.env` with the following content:

```env
PORT=3001
APP_ENV=development

# MongoDB
MONGO_URI=mongodb://admin:adminpassword@localhost:27017/youappdb?authSource=admin

# RabbitMQ
RABBITMQ_URL=amqp://admin:adminpassword@localhost:5672

# JWT
JWT_SECRET=your_super_secret_key
JWT_ACCESS_TTL=5m
JWT_REFRESH_TTL=30d
```

> You need to have MongoDB and RabbitMQ running locally or in Docker.

### 3. Install backend dependencies and run

```bash
npm install
npm run start:dev
```

Backend will run on: **http://localhost:3001**

---

## 📱 Flutter App Setup

### 1. Clone the Flutter App

```bash
git clone https://github.com/avesin/flutter-youapp.git
cd flutter-youapp
```

### 2. Create `.env` for Flutter

In the root of the Flutter project, create a `.env` file (using [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)):

```env
API_URL=http://localhost:3001/api
SOCKET_URL=http://localhost:3001
```

> On real device or emulator, make sure the IP points to your host machine (e.g. 10.0.2.2 for Android Emulator).

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the app

```bash
flutter run
```

---

## ✅ Features Covered in This Test

- [x] Login / Register
- [x] JWT session handling
- [x] Profile update
- [x] Interest tagging
- [x] Username availability
- [x] Send message via REST → RabbitMQ → MongoDB
- [x] WebSocket receive in real-time

---

## 🧠 Why use your own backend?

This test demonstrates fullstack control:
- You own and understand both ends (backend + frontend)
- You use RabbitMQ and MongoDB with production-level architecture
- Real-time messaging over WebSocket is fully under your logic

---