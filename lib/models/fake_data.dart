import 'package:tec/models/data_models.dart';

Map homePagePosterMap = {
  "imageAsset": "assets/images/poster.png",
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره ی...س",
  "view": "251",
};

// blog fake data

List<HasTagModel> tagList = [
  HasTagModel(title: "جاوا"),
  HasTagModel(title: "کاتلین"),
  HasTagModel(title: "وب"),
  HasTagModel(title: "هوش مصنوعی"),
  HasTagModel(title: "iot"),
  HasTagModel(title: "دارت"),
];

List<HasTagModel> selectedTags = [];

List<BlogModel> blogList = [
  BlogModel(
    id: 0,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/hero-image.fill_.size_1248x702.v1786360680-791x482.jpg",
    title: "نقد سریال خاندان اژدها (House of The Dragon) | فصل سوم، قسمت آخر",
    writer: "ایمان اکرمی ",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/qkD4WWUD4boVc2y6EtHLEV-910x600.jpg",
    title: "شایعه: Marvel’s Spider-Man 3 در حال توسعه است",
    writer: "رایکا شریفی",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "1 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "325",
  ),
  BlogModel(
    id: 2,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/ps5-wolverine-models-910x600.jpg",
    title: "نسخه محدود کنسول PS5 با طرح Marvel’s Wolverine معرفی شد",
    writer: "علیرضا طالقانی",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "4 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "139",
  ),
  BlogModel(
    id: 3,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/kamiya-main-1702638194160-910x600.webp",
    title: "هیدکی کامیا: اگر Devil May Cry دیگری بسازم، بخش‌های مبهم داستان روشن خواهد شد",
    writer: "نیما زند",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "1 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "563",
  ),
  BlogModel(
    id: 4,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/01KGFSVT0TGAGQQ927N9DE9043-910x565.jpeg",
    title: "جف کیلی تاریخ مراسم The Game Awards سال ۲۰۲۶ را اعلام کرد",
    writer: "رایکا شریفی",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "9 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "974",
  ),
  BlogModel(
    id: 5,
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2026/08/images-6.jpeg",
    title: "50 Cent تهیه‌کنندگی سریال Payday را بر عهده گرفت",
    writer: " احسان حسین خواه",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "12 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "1054",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
  BlogModel(
    id: 1,
    imageUrl:
        "https://static.digiato.com/digiato/2026/07/chris-nolan-910x600.jpg.webp",
    title: "امیرحسین",
    writer: "پرستو حبیب پور",
    writerImageUrl:
        "https://digiato.com/wp-content/uploads/avatars/58838-1769580150-32x32.jpg",
    date: "2 روز پیش",
    content: "هیچ اطلاعاتی ندرام",
    views: "256",
  ),
];

List<BlogModelPodcast> blogListPodcast = [
  BlogModelPodcast(
    id: 1,
    title: "رمزون",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2024/04/Banner-1-910x600.webp",
  ),
  BlogModelPodcast(
    id: 1,
    title: "رادیو کدیاد",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/06/Banner-1-1600x751.webp",
  ),
  BlogModelPodcast(
    id: 1,
    title: "تکنو کست",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/08/Banner-4-1600x751.jpg",
  ),
  BlogModelPodcast(
    id: 1,
    title: "رمزون",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/11/Banner-11-791x482.jpg",
  ),
  BlogModelPodcast(
    id: 1,
    title: "رمزون",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/11/Banner-16-1600x751.jpg",
  ),
  BlogModelPodcast(
    id: 1,
    title: "رمزون",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/09/Banner-12-791x482.jpg",
  ),
  BlogModelPodcast(
    id: 1,
    title: "رمزون",
    imageUrl:
        "https://vigiato.net/wp-content/uploads/2025/09/Banner-7-791x482.jpg",
  ),
];
