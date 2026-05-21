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
    //perfumes
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
      "name": "Lattafa Asad Eau De Parfum 100ml – Long Lasting Unisex Perfume",
      "price": 4000.0,
      "offer_price": 2149.0,
      "image": "images/products/perfume4.webp",
      "category": "Perfumes",
      "description":
          "Unleash your bold side with Lattafa Asad Eau De Parfum – a luxurious unisex scent inspired by power, charisma, and elegance. If you crave a fragrance that commands attention while blending spicy warmth and smooth vanilla, this is your go-to signature scent.",
    },
    {
      "id": "5",
      "name":
          "Lattafa Angham Eau De Parfum for Women 100ml – Original Arabic Perfume",
      "price": 4500.0,
      "offer_price": 2649.0,
      "image": "images/products/perfume5.webp",
      "category": "Perfumes",
      "description":
          "Indulge in the luxurious scent of Lattafa Angham Eau De Parfum. This 100ml fragrance for women exudes elegance and sophistication with its blend of fragrant notes. Perfect for any occasion, let this perfume elevate your presence and leave a lasting impression of grace and refinement.",
    },

    {
      "id": "6",
      "name": "Lattafa Yara Candy Eau De Parfum 100ml For Women",
      "price": 4000.0,
      "offer_price": 1999.0,
      "image": "images/products/perfume6.webp",
      "category": "Perfumes",
      "description":
          "Introducing Lattafa Yara Candy, the sweetest scent for women. This Eau De Parfum comes in a 100ml bottle, perfect for daily wear. The playful combination of fruity and floral notes will leave you feeling fresh and confident all day long. (Don't worry, it's not actually made of candy.)",
    },
    {
      "id": "7",
      "name": "Rasasi Ice Perfume for men",
      "price": 5500.0,
      "offer_price": 3849.0,
      "image": "images/products/perfume7.webp",
      "category": "Perfumes",
      "description":
          "Experience complete confidence with Rasasi Hawas Ice Eau de Parfum, a 100 ml scent tailor-made for men. Infused with energy, the scent provides strength and assurance, leaving you empowered and ready to take on the world.\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nMiddle Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.",
    },
    {
      "id": "8",
      "name": "Lattafa Yara Eau De Parfum 100ml For Women",
      "price": 4000.0,
      "offer_price": 2149.0,
      "image": "images/products/perfume8.webp",
      "category": "Perfumes",
      "description":
          "Indulge in the enchanting scent of Lattafa Yara Eau De Parfum. This 100ml fragrance for women is a perfect blend of sophistication and allure. Let the captivating notes of this perfume transport you to a world of elegance and charm. Truly irresistible!\nFragrance Notes -\n\nTop Notes: Tangerine, Heliotrope, Orchid\nHeart Notes :Tropical Notes, Gourmand\nBase Notes : Vanila, Sandalwood, Musk",
    },

    {
      "id": "9",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/perfume9.webp",
      "category": "Perfumes",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "10",
      "name": "Rasasi Ice Perfume for men",
      "price": 5500.0,
      "offer_price": 3849.0,
      "image": "images/products/perfume10.webp",
      "category": "Perfumes",
      "description":
          "Experience complete confidence with Rasasi Hawas Ice Eau de Parfum, a 100 ml scent tailor-made for men. Infused with energy, the scent provides strength and assurance, leaving you empowered and ready to take on the world.\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nMiddle Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.",
    },
    //giftsets
    {
      "id": "11",
      "name": "Gift Set Of Rasasi Hawas Ice Eau de Parfum 100ml For Men",
      "price": 6500.0,
      "offer_price": 3999.0,
      "image": "images/products/giftset1.webp",
      "category": "GiftSets",
      "description":
          "Experience the ultimate chill with Rasasi Hawas Ice—a frosty fragrance that transforms your everyday moments into something extraordinary. This 100ml powerhouse delivers crisp, invigorating notes that awaken your senses and keep you feeling fresh all day long. Perfect for the modern man who refuses to play it safe, this gift set arrives beautifully packaged and ready to impress. Whether you're treating yourself or surprising someone special, Hawas Ice is your ticket to smelling absolutely legendary. Embrace the cool factor and let this iconic scent become your signature move.\n\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nHeart Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.\n\nThis Set Includes -\n\n100ml EDP\n60ML Shower Gel\n10ml Travel Spray",
    },
    {
      "id": "12",
      "name":
          "Gift Set Of Armaf Club De Nuit Pink Eau De Parfum 105ml For Women",
      "price": 5000.0,
      "offer_price": 3145.0,
      "image": "images/products/giftset2.webp",
      "category": "GiftSets",
      "description":
          "Unleash your inner playfulness with this gift set of Armaf Club De Nuit Pink Eau De Parfum. Featuring a sensual 105ml EDT and a refreshing 200ml deodorant, this set is perfect for the playful woman in your life. Let her embrace her quirky side with this unique and delightful gift set.\n\nFragrance Notes -\nTop Notes - Orange, Grapefruit, Bergamot and Peach;\nMiddle Notes - Rose, Geranium, Jasmine and Litchi;\nBase Notes - Patchouli, Vanilla, Musk and Vetiver.\n\nThis Gift Set Contains - \n\nArmaf Club De Nuit Women 105ml EDT \nArmaf Club De Nuit Women 200ml Deodorant ",
    },
    {
      "id": "13",
      "name":
          "Gift Set Of Arabiyat Oud Al Layl Midnight Edition (100ML EDP + 200ML Deo )for Men & Women",
      "price": 0.0,
      "offer_price": 1599.0,
      "image": "images/products/giftset3.webp",
      "category": "GiftSets",
      "description":
          "Step into the shadows with the Arabiyat Oud Al Layl Midnight Edition gift set. Whether you’re feeling mysterious or just plain magnetic, this dynamic duo—a 100ml EDP and 200ml deodorant—has you covered. It’s woody, bold, and perfect for anyone who wants to turn heads long after the sun goes down. Ready to claim the night?",
    },
    {
      "id": "14",
      "name":
          "Gift Set Of Lattafa Artisan Ethnique Eau De Parfum 100ml For Man & Woman",
      "price": 6200.0,
      "offer_price": 4200.0,
      "image": "images/products/giftset4.webp",
      "category": "GiftSets",
      "description":
          "Discover the refined allure of the Gift Set of Lattafa Artisan Ethnique Eau De Parfum 100ml, designed for both men and women. This sophisticated fragrance artfully combines traditional and contemporary notes, creating a captivating scent that embodies cultural elegance. An ideal gift for those who appreciate timeless, distinctive aromas.",
    },
    {
      "id": "15",
      "name": "Discovery Set Of Armaf Club De Nuit Series 5mlx10 For Man & Woman",
      "price": 10000.0,
      "offer_price": 7499.0,
      "image": "images/products/giftset6.webp",
      "category": "GiftSets",
      "description":
          "Discover the versatility of Armaf's most celebrated fragrances with this premium 10-piece collection. Each 5ml bottle delivers the full character of iconic scents including Club De Nuit Pink, Imperiale, Intense Woman, Intense Man, Oud, Iconic, Milestone, Untold, Sillage, and Urban Man Elixir. Perfect for exploring different moods and occasions, this set lets you experience luxury fragrances without committing to full sizes. "   },
    {
      "id": "16",
      "name":"Armaf Emotions Collection Eau De Parfum 7pc Set For Man & Woman",
      "price": 5000.0,
      "offer_price": 4000.0,
      "image": "images/products/giftset5.webp",
      "category": "GiftSets",
      "description":"Experience the Armaf Emotions Collection Eau De Parfum 7-piece set for men and women, thoughtfully curated to suit every mood and moment. This elegant set includes a 100ml Heart fragrance and six 15ml scents—Confident, Dynamic, Fresh, Hypnotic, Relax, and Romantic—each crafted to evoke distinct emotions."    },
    {
      "id": "17",
      "name": "Gift Set Of Nautica Midnight Voyage Eau De Toilette (50ml + 7ml) For Men",
      "price": 3400.0,
      "offer_price": 2380.0,
      "image": "images/products/giftset7.webp",
      "category": "GiftSets",
      "description":
          "Indulge in the luxurious scent of Nautica Midnight Voyage with this elegant gift set. Featuring a 50ml bottle of the sophisticated Eau De Toilette, as well as a travel-friendly 7ml bottle, this set is perfect for the discerning gentleman. Treat yourself or a loved one to the exclusive and refined fragrance of Nautica Midnight Voyage.",
    },
    {
      "id": "18",
      "name":"IBRAQ Mini Summer Collection 20mlx6 For Man",  
      "price": 8000.0,
      "offer_price": 6499.0,
      "image": "images/products/giftset8.webp",
      "category": "GiftSets",
      "description":"Why settle for one summer vibe when you can have the whole coastline? The IBRAQ Mini Summer Collection features six 20ml deluxe travel flacons designed for the man who refuses to stay in one place. From the salty energy of Sea Breeze to the bold, leathery warmth of Riviera Sunset, this set is your ultimate holiday rotation. Pack them all and be the main character of every beach club from Dubai to Saint-Tropez."    },
    {
      "id": "19",
      "name": "Gift Set Of Arabiyat Elham (100ML EDP + 200ML Deo ) for Men & Women",
      "price": 0.0,
      "offer_price": 1599.0,
      "image": "images/products/giftset9.webp",
      "category": "GiftSets",
      "description":"Discover the perfect gift with Arabiyat Elham, a luxurious fragrance collection designed for both men and women. This elegant set includes a 100ML Eau de Parfum and a 200ML Deodorant, offering a complete aromatic experience. The rich, sophisticated scent of Arabiyat Elham captures the essence of timeless elegance with warm, oriental notes that linger beautifully throughout the day. "
    },
    {
      "id": "20",
      "name":"Discovery Set Of Armaf Odyssey Eau De Parfum 12x 10ml For Man & Woman"  ,
      "price": 5850.0,
      "offer_price": 3999.0,
      "image": "images/products/giftset10.webp",
      "category": "GiftSets",
      "description":"Unleash your inner scent-shifter with the Armaf Odyssey Discovery Set! Featuring 12 sleek 10ml vials, this collection is a total playground for your pulse points. Whether you’re feeling moody and mysterious or bright and bold, there’s a vibe for every mood and gender. Spritz, layer, and find your new signature—it’s a full-blown fragrance festival in one box!"    },
    //DEODORANTS
    {
      "id": "21",
      "name": "Calvin Klein One Deodorant 150ml For Men",
      "price": 1700.0,
      "offer_price": 1360.0,
      "image": "images/products/deo1.webp",
      "category": "Deodorants",
      "description":
          "Calvin Klein One Deodorant 150ml for Men offers a refined and long-lasting freshness that complements your lifestyle. Its subtle yet distinctive scent ensures all-day confidence while maintaining a clean, invigorating feeling. ",
    },
    {
      "id": "22",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo2.webp",
      "category": "Deodorants",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "23",
      "name": "Armaf Club De Nuit Intense Deodorant For Men 200ml",
      "price": 349.0,
      "offer_price": 296.0,
      "image": "images/products/deo3.webp",
      "category": "Deodorants",
      "description":
          "This Armaf Club De Nuit Intense Deodorabt is designed to keep men feeling fresh and confident all day long. With its long-lasting formula and masculine scent, it provides 24-hour protection against sweat and odor. Stay on top of your game with this powerful deodorant.",
    },
    {
      "id": "24",
      "name": "Clinique Happy Deodorant For Men 200ml",
      "price": 1550.0,
      "offer_price": 1249.0,
      "image": "images/products/deo4.webp",
      "category": "Deodorants",
      "description":
          "The Clinique Happy for Men Deodorant Body Spray is a light and refreshing fragrance that effectively keeps unwanted odor at bay, leaving you smelling fresh and clean all day long. With its invigorating blend of citrusy orange and lemon notes, along with the crisp scent of sea water, this body spray is the perfect companion for any occasion, day or night.",
    },
    {
      "id": "25",
      "name": "Lattafa Oud For Glory Deodorant Spray 250ml For Men & Women",
      "price": 450.0,
      "offer_price": 399.0,
      "image": "images/products/deo5.webp",
      "category": "Deodorants",
      "description":
          "Experience a luxurious and long-lasting freshness with Lattafa Oud For Glory Deodorant Spray. This spray, designed for both men and women, is enriched with the finest Oud fragrance to provide a distinctly rich and woody scent. With its 250ml size, stay fresh all day with just a few sprays.",
    },
    {
      "id": "26",
      "name": "Rasasi Twinkle Pour Femme Deodorant Spray 200ml",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo6.webp",
      "category": "Deodorants",
      "description":
          "Experience long-lasting freshness and confidence with Rasasi Twinkle Pour Femme Deodorant Spray. Its unique formula keeps you feeling fresh and smelling great for up to 24 hours. With a refreshing, floral scent, this deodorant spray is the perfect addition to your daily routine.",
    },
    {
      "id": "27",
      "name": "Afnan Supremacy For Men Deodorant Spray 250ml For Men",
      "price": 899.0,
      "offer_price": 649.0,
      "image": "images/products/deo7.webp",
      "category": "Deodorants",
      "description":
          "Afnan Supremacy for Men Deodorant Spray is a grooming product designed for men to provide all-day protection against sweat and odor. This deodorant spray comes in a 250ml bottle and is formulated with a refreshing fragrance that leaves the user feeling fresh and confident. ",
    },
    {
      "id": "28",
      "name": "Rasasi Royale Pour Homme Deodorant Body Spray For Men 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo8.webp",
      "category": "Deodorants",
      "description":
          "Experience all-day freshness with Rasasi Royale Pour Homme Deodorant Body Spray. This 200 ML spray is specially designed for men, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any man's daily routine.",
    },
    {
      "id": "29",
      "name": "Lattafa Musamam White Perfumed Spray 200ml",
      "price": 0.0,
      "offer_price": 325.0,
      "image": "images/products/deo9.webp",
      "category": "Deodorants",
      "description":
          "Meet your new fragrance best friend—Lattafa Musamam White Perfumed Spray! This gorgeous 200ml bottle brings a fresh, luminous scent that feels like a breath of pure bliss. Musamam White is all about elegance with a fun twist, perfect for anyone who wants to feel refreshed and fabulous all day long. ",
    },
    {
      "id": "30",
      "name": "Rasasi Royale Blue Pour Femme Deodorant Spray 200ml",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo10.webp",
      "category": "Deodorants",
      "description":
          "Discover the luxurious scent of Rasasi Royale Blue Pour Femme Deodorant Spray 200ml. This deodorant spray offers long-lasting freshness and protection against body odor. The distinctive blend of notes creates an elegant and refreshing aroma, making it perfect for daily wear. Formulated with high-quality ingredients, it will keep you feeling confident and smelling great all day long.",
    },
    {
      "id": "31",
      "name": "Rasasi Blue Lady Deodorant Body Spray For Women 200 ML",
      "price": 0.0,
      "offer_price": 349.0,
      "image": "images/products/deo11.webp",
      "category": "Deodorants",
      "description":
          "Experience long-lasting freshness with Rasasi Blue Lady Deodorant Body Spray. Specifically designed for women, this 200 ML spray combines a refreshing scent with effective odor protection. Stay confident and comfortable throughout the day with this expertly formulated body spray.",
    },
    {
      "id": "32",
      "name": "Royal Mirage Rose Body Spray 200ml Men",
      "price": 449.0,
      "offer_price": 349.0,
      "image": "images/products/deo12.webp",
      "category": "Deodorants",
      "description":
          "Indulge in the luxurious scent of Royal Mirage Rose Body Spray for Men. This elegant and exclusive body spray features a delicate and sophisticated rose fragrance, evoking the world of art and literature. Perfect for the modern man who appreciates the finer things in life.",
    },

    //FragranceMists
    {
      "id": "33",
      "name": "Rasasi Chastity Fragrance Body Mist 250ml For Men & Women",
      "price": 999.0,
      "offer_price": 799.0,
      "image": "images/products/mist1.webp",
      "category": "FragranceMists",
      "description":
          "Experience long-lasting freshness with Rasasi Chastity's Fragrance Body Mist for men and women. This powerhouse product contains 250ml of high-grade fragrance that reduces body odor and provides you with 24 hour freshness. Enjoy a balanced blend of relaxed notes for a delightful scent that will make you feel refreshed and energized.",
    },
    {
      "id": "34",
      "name": "Rasasi Aroma Intense Fragrance Body Mist 250ml For Women",
      "price": 999.0,
      "offer_price": 799.0,
      "image": "images/products/mist2.webp",
      "category": "FragranceMists",
      "description":
          "Rasasi Aroma Intense Fragrance Body Mist for Women offers up to 12-hour protection with its floriental floral notes and musky woody base notes. Enjoy a blend of floral and oriental notes that are sure to keep you feeling confident all day long.",
    },

    {
      "id": "35",
      "name": "Rasasi Blue Lady Fragrance Body Mist 250ml For Women",
      "price": 999.0,
      "offer_price": 799.0,
      "image": "images/products/mist3.webp",
      "category": "FragranceMists",
      "description":
          "Discover the exotic beauty of Rasasi's Blue Lady Fragrance Body Mist, specifically crafted for women. This luxurious 250ml mist is infused with an intriguing blend of oriental flower, cedarwood and patchouli notes. Enjoy the sensual aroma while feeling soft and refreshed.",
    },

    {
      "id": "36",
      "name": "Rasasi Innocence Fragrance Body Mist 250ml For Men & Women",
      "price": 1299.0,
      "offer_price": 749.0,
      "image": "images/products/mist4.webp",
      "category": "FragranceMists",
      "description":
          "Adorn yourself with the sophisticated scent of Risasi Innocence Fragrance Body Mist. This 250ml bottle offers a perfect aromatic blend with top notes of spices and citrus, seamlessly combining with heart notes of musk and base notes of woody tones. Enjoy the scent for hours.",
    },
    {
      "id": "37",
      "name":
          "Victoria's Secret Love Spell Romance Fragrance Mist 250ml For Women",
      "price": 2499.0,
      "offer_price": 1870.0,
      "image": "images/products/mist5.webp",
      "category": "FragranceMists",
      "description":
          "Treat yourself to the delightfully-scented Victoria's Secret Love Spell Romance Fragrance Mist. Blended with romantic notes of peach, cherry blossom, and white jasmine, this 250ml spray for women will make you feel intensely feminine and irresistibly attractive.",
    },

    {
      "id": "38",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/mist6.webp",
      "category": "FragranceMists",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "39",
      "name": "Rasasi Royale Fragrance Body Mist 250ml For Women",
      "price": 899.0,
      "offer_price": 799.0,
      "image": "images/products/mist7.webp",
      "category": "FragranceMists",
      "description":
          "Experience the fine scent of luxury with the Rasasi Royale Fragrance Body Mist for Women. This 250ml body mist offers a subtle yet delightful scent that will last all day long. The perfect addition to your everyday routine, the Rasasi Royale Fragrance Body Mist for Women will bring you the elegance of royal living.",
    },
    {
      "id": "40",
      "name":
          "Armaf Italiano Vivo Uomo Fragrance Body Spray Mist For Unisex 250 ml",
      "price": 1350.0,
      "offer_price": 850.0,
      "image": "images/products/mist8.webp",
      "category": "FragranceMists",
      "description":
          "Armaf Italiano  UOMO fragrance body spray, 250ml. An expression of luxury that is innovative and couture.",
    },
    {
      "id": "41",
      "name": "Rasasi Exotic Aroma Fragrance Body Mist 250ml For Women",
      "price": 999.0,
      "offer_price": 799.0,
      "image": "images/products/mist9.webp",
      "category": "FragranceMists",
      "description":
          "Experience a tantalizing scent with Rasasi Exotic Aroma Fragrance Body Mist for Women. Its luxurious combination of alluring floral and musky wood notes, and its 250ml spray bottle, allows you to enjoy a truly exotic and luxurious aroma.",
    },
    {
      "id": "42",
      "name": "Victoria's Secret Amber Romance Fragrance Mist 250ml For Women",
      "price": 2499.0,
      "offer_price": 1870.0,
      "image": "images/products/mist10.webp",
      "category": "FragranceMists",
      "description":
          "Victoria's Secret Amber Romance Fragrance Mist for Women delivers an irresistible and sensual scent you'll love. Blended from top notes of black cherry and raspberry, mid notes of osmanthus and rose petal, and base notes of amber and vanilla, this 250ml mist captivates and flatters.",
    },

    //Lotions
    {
      "id": "43",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/lotion1.jpg",
      "category": "BodyLotions",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "44",
      "name": "Gift Set Of Rasasi Hawas Ice Eau de Parfum 100ml For Men",
      "price": 6500.0,
      "offer_price": 3999.0,
      "image": "images/products/lotion2.webp",
      "category": "BodyLotions",
      "description":
          "Experience the ultimate chill with Rasasi Hawas Ice—a frosty fragrance that transforms your everyday moments into something extraordinary. This 100ml powerhouse delivers crisp, invigorating notes that awaken your senses and keep you feeling fresh all day long. Perfect for the modern man who refuses to play it safe, this gift set arrives beautifully packaged and ready to impress. Whether you're treating yourself or surprising someone special, Hawas Ice is your ticket to smelling absolutely legendary. Embrace the cool factor and let this iconic scent become your signature move.\n\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nHeart Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.\n\nThis Set Includes -\n\n100ml EDP\n60ML Shower Gel\n10ml Travel Spray",
    },
    {
      "id": "45",
      "name":
          "Gift Set Of Armaf Club De Nuit Pink Eau De Parfum 105ml For Women",
      "price": 5000.0,
      "offer_price": 3145.0,
      "image": "images/products/lotion3.webp",
      "category": "BodyLotions",
      "description":
          "Unleash your inner playfulness with this gift set of Armaf Club De Nuit Pink Eau De Parfum. Featuring a sensual 105ml EDT and a refreshing 200ml deodorant, this set is perfect for the playful woman in your life. Let her embrace her quirky side with this unique and delightful gift set.\n\nFragrance Notes -\nTop Notes - Orange, Grapefruit, Bergamot and Peach;\nMiddle Notes - Rose, Geranium, Jasmine and Litchi;\nBase Notes - Patchouli, Vanilla, Musk and Vetiver.\n\nThis Gift Set Contains - \n\nArmaf Club De Nuit Women 105ml EDT \nArmaf Club De Nuit Women 200ml Deodorant ",
    },
    {
      "id": "46",
      "name": "Calvin Klein One Deodorant 150ml For Men",
      "price": 1700.0,
      "offer_price": 1360.0,
      "image": "images/products/lotion4.webp",
      "category": "BodyLotions",
      "description":
          "Calvin Klein One Deodorant 150ml for Men offers a refined and long-lasting freshness that complements your lifestyle. Its subtle yet distinctive scent ensures all-day confidence while maintaining a clean, invigorating feeling. ",
    },
    {
      "id": "47",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/lotion5.webp",
      "category": "BodyLotions",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "48",
      "name": "Rasasi Ice Perfume for men",
      "price": 5500.0,
      "offer_price": 3849.0,
      "image": "images/products/lotion6.webp",
      "category": "BodyLotions",
      "description":
          "Experience complete confidence with Rasasi Hawas Ice Eau de Parfum, a 100 ml scent tailor-made for men. Infused with energy, the scent provides strength and assurance, leaving you empowered and ready to take on the world.\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nMiddle Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.",
    },
    //fragrance sticks
    {
      "id": "49",
      "name": "Lattafa Yara Eau De Parfum 100ml For Women",
      "price": 4000.0,
      "offer_price": 2149.0,
      "image": "images/products/stick1.webp",
      "category": "DeodorantStick",
      "description":
          "Indulge in the enchanting scent of Lattafa Yara Eau De Parfum. This 100ml fragrance for women is a perfect blend of sophistication and allure. Let the captivating notes of this perfume transport you to a world of elegance and charm. Truly irresistible!\nFragrance Notes -\n\nTop Notes: Tangerine, Heliotrope, Orchid\nHeart Notes :Tropical Notes, Gourmand\nBase Notes : Vanila, Sandalwood, Musk",
    },

    {
      "id": "50",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/stick2.webp",
      "category": "DeodorantStick",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "51",
      "name": "Gift Set Of Rasasi Hawas Ice Eau de Parfum 100ml For Men",
      "price": 6500.0,
      "offer_price": 3999.0,
      "image": "images/products/stick3.webp",
      "category": "DeodorantStick",
      "description":
          "Experience the ultimate chill with Rasasi Hawas Ice—a frosty fragrance that transforms your everyday moments into something extraordinary. This 100ml powerhouse delivers crisp, invigorating notes that awaken your senses and keep you feeling fresh all day long. Perfect for the modern man who refuses to play it safe, this gift set arrives beautifully packaged and ready to impress. Whether you're treating yourself or surprising someone special, Hawas Ice is your ticket to smelling absolutely legendary. Embrace the cool factor and let this iconic scent become your signature move.\n\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nHeart Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.\n\nThis Set Includes -\n\n100ml EDP\n60ML Shower Gel\n10ml Travel Spray",
    },
    {
      "id": "52",
      "name":
          "Gift Set Of Armaf Club De Nuit Pink Eau De Parfum 105ml For Women",
      "price": 5000.0,
      "offer_price": 3145.0,
      "image": "images/products/stick4.webp",
      "category": "DeodorantStick",
      "description":
          "Unleash your inner playfulness with this gift set of Armaf Club De Nuit Pink Eau De Parfum. Featuring a sensual 105ml EDT and a refreshing 200ml deodorant, this set is perfect for the playful woman in your life. Let her embrace her quirky side with this unique and delightful gift set.\n\nFragrance Notes -\nTop Notes - Orange, Grapefruit, Bergamot and Peach;\nMiddle Notes - Rose, Geranium, Jasmine and Litchi;\nBase Notes - Patchouli, Vanilla, Musk and Vetiver.\n\nThis Gift Set Contains - \n\nArmaf Club De Nuit Women 105ml EDT \nArmaf Club De Nuit Women 200ml Deodorant ",
    },
    {
      "id": "53",
      "name": "Calvin Klein One Deodorant 150ml For Men",
      "price": 1700.0,
      "offer_price": 1360.0,
      "image": "images/products/stick5.webp",
      "category": "DeodorantStick",
      "description":
          "Calvin Klein One Deodorant 150ml for Men offers a refined and long-lasting freshness that complements your lifestyle. Its subtle yet distinctive scent ensures all-day confidence while maintaining a clean, invigorating feeling. ",
    },
    {
      "id": "54",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/stick6.webp",
      "category": "DeodorantStick",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "55",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/stick7.webp",
      "category": "DeodorantStick",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "56",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/stick8.webp",
      "category": "DeodorantStick",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "57",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/stick9.webp",
      "category": "DeodorantStick",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
    {
      "id": "58",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/stick10.webp",
      "category": "DeodorantStick",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
  ];
}
