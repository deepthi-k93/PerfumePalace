class AllItems {
  //CATEGORIES
   final List<Map<String, dynamic>> categories = const [
    {"name": "Perfumes", "image": "images/category/category1.webp"},
    {"name": "GiftSets", "image": "images/category/category2.webp"},
    {"name": "Deodorants", "image": "images/category/category3.webp"},
    {"name": "FragranceMists", "image": "images/category/category4.webp"},
    {"name": "BodyLotions", "image": "images/category/category5.webp"},
    {"name": "DeodorantStick", "image": "images/category/category6.webp"},
  ];

  //  FIXED PRODUCTS (price as double)
  final List<Map<String, dynamic>> products = const [
    {
      "id": "1",
      "name": "Rasasi Ice Perfume for men",
      "price": 5500.0,
      "offer_price": 3849.0,
      "image": "images/products/perfume1.webp",
      "category": "Perfumes",
      "description":
          "Experience complete confidence with Rasasi Hawas Ice Eau de Parfum, a 100 ml scent tailor-made for men. Infused with energy, the scent provides strength and assurance, leaving you empowered and ready to take on the world.\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nMiddle Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.",
    },
    {
      "id": "2",
      "name": "Lattafa Yara Eau De Parfum 100ml For Women",
      "price": 4000.0,
      "offer_price": 2149.0,
      "image": "images/products/perfume2.webp",
      "category": "Perfumes",
      "description":
          "Indulge in the enchanting scent of Lattafa Yara Eau De Parfum. This 100ml fragrance for women is a perfect blend of sophistication and allure. Let the captivating notes of this perfume transport you to a world of elegance and charm. Truly irresistible!\nFragrance Notes -\n\nTop Notes: Tangerine, Heliotrope, Orchid\nHeart Notes :Tropical Notes, Gourmand\nBase Notes : Vanila, Sandalwood, Musk",
    },

    {
      "id": "3",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/perfume3.jpg",
      "category": "Perfumes",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "4",
      "name": "Gift Set Of Rasasi Hawas Ice Eau de Parfum 100ml For Men",
      "price": 6500.0,
      "offer_price": 3999.0,
      "image": "images/products/giftset1.webp",
      "category": "Gift Sets",
      "description":
          "Experience the ultimate chill with Rasasi Hawas Ice—a frosty fragrance that transforms your everyday moments into something extraordinary. This 100ml powerhouse delivers crisp, invigorating notes that awaken your senses and keep you feeling fresh all day long. Perfect for the modern man who refuses to play it safe, this gift set arrives beautifully packaged and ready to impress. Whether you're treating yourself or surprising someone special, Hawas Ice is your ticket to smelling absolutely legendary. Embrace the cool factor and let this iconic scent become your signature move.\n\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nHeart Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.\n\nThis Set Includes -\n\n100ml EDP\n60ML Shower Gel\n10ml Travel Spray",
    },
    {
      "id": "5",
      "name":
          "Gift Set Of Armaf Club De Nuit Pink Eau De Parfum 105ml For Women",
      "price": 5000.0,
      "offer_price": 3145.0,
      "image": "images/products/giftset2.webp",
      "category": "Gift Sets",
      "description":
          "Unleash your inner playfulness with this gift set of Armaf Club De Nuit Pink Eau De Parfum. Featuring a sensual 105ml EDT and a refreshing 200ml deodorant, this set is perfect for the playful woman in your life. Let her embrace her quirky side with this unique and delightful gift set.\n\nFragrance Notes -\nTop Notes - Orange, Grapefruit, Bergamot and Peach;\nMiddle Notes - Rose, Geranium, Jasmine and Litchi;\nBase Notes - Patchouli, Vanilla, Musk and Vetiver.\n\nThis Gift Set Contains - \n\nArmaf Club De Nuit Women 105ml EDT \nArmaf Club De Nuit Women 200ml Deodorant ",
    },
    {
      "id": "6",
      "name": "Calvin Klein One Deodorant 150ml For Men",
      "price": 1700.0,
      "offer_price": 1360.0,
      "image": "images/products/deo1.webp",
      "category": "Deodorants",
      "description":
          "Calvin Klein One Deodorant 150ml for Men offers a refined and long-lasting freshness that complements your lifestyle. Its subtle yet distinctive scent ensures all-day confidence while maintaining a clean, invigorating feeling. ",
    },
    {
      "id": "7",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo2.webp",
      "category": "Deodorants",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
  ];
}