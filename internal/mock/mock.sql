insert into categories(image, name_fa, name_en) values
  ('/images/routes/home/category-slider-1.png', 'موبایل و لوازم جانبی', 'Mobile & Accessories'),
  ('/images/routes/home/category-slider-2.png', 'لپ تاپ و کامپیوتر', 'Laptop & Computer'),
  ('/images/routes/home/category-slider-3.png', 'لوازم خانگی', 'Home Appliances'),
  ('/images/routes/home/category-slider-4.png', 'مد و پوشاک', 'Fashion & Clothing'),
  ('/images/routes/home/category-slider-5.png', 'ورزش و سرگرمی', 'Sport & Entertainment');

insert into products(category_id, images, name_fa, name_en, description, attributes, price, price_off, quantity) values
    ( 
        (select id from categories where name_fa = 'موبایل و لوازم جانبی'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/13-2.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-5.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/4-7.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/3-7.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/5-7.jpg'],
        'هدست پلی استیشن سونی اسلیم مدل پالس لایت وایرلس',
        'Sony PlayStation 4 Headset Model PULSD',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        76530000,
        null,
        22970
    ),
    ( 
        (select id from categories where name_fa = 'موبایل و لوازم جانبی'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/3-7.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-1.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/4-1.jpg'],
        'گوشی موبايل موتورولا مدل ادج پرو ظرفیت به همراه کارت هدیه',
        'Motorola Edge Pro mobile phone One RAM with gift card',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        15200000,
        13400000,
        20
    ),
    ( 
        (select id from categories where name_fa = 'موبایل و لوازم جانبی'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/1-11.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/Frame-19-1.png'],
        'گوشی موبایل اپل مدل آیفون 13 نات اکتیو تک سیم کارت ظرفیت 128 گیگابایت رم 4 گیگابایت',
        'Apple iPhone Pro Not Active Mobile Phone Refurbish Part Number',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        42500000,
        null,
        43
    ),
    ( 
        (select id from categories where name_fa = 'موبایل و لوازم جانبی'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/7-5.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/4.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/6.jpg'],
        'گوشی موبایل شیائومی مدل پوکو دو سیم کارت ظرفیت نات اکتیو',
        'Xiaomi Poco Dual SIM And RAM Mobile Phone',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        20200000,
        null,
        232
    ),
    ( 
        (select id from categories where name_fa = 'موبایل و لوازم جانبی'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/8-3.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/1-4.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-3.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/3-3.png'],
        'گوشی موبایل شیائومی مدل ردمی‌نوت دو سیم‌ کارت نات‌اکتیو',
        'Xiaomi Redmi Note Dual SIM And RAM Mobile Phone',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        24200000,
        null,
        10
    ),
    ( 
        (select id from categories where name_fa = 'لپ تاپ و کامپیوتر'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/1-18.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/4-7.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-4.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/1-5.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/3-4.jpg'],
        'لپ تاپ 13 اینچ اپل مدل مک‌بوک ایر هارد اس‌اس‌دی 500 گیگ ریجن آسیا',
        'Apple MacBook Air MGB RAM GB SSD Laptop',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        24200000,
        23400000,
        23
    ),
    ( 
        (select id from categories where name_fa = 'لپ تاپ و کامپیوتر'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/3-15.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/1-3.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-2.jpg', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/3-2.jpg'],
        'لپ تاپ اپل مدل مک بوک ایر مکس یک ترابایت',
        'Apple MacBook Air MGN LLA GB SSD inch Laptop',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        76530000,
        null,
        8
    ),
    ( 
        (select id from categories where name_fa = 'لپ تاپ و کامپیوتر'),
        ARRAY['https://shopi.codisa.ir/wp-content/uploads/2024/10/7-11.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/4-7.png', 'https://shopi.codisa.ir/wp-content/uploads/2024/10/2-4.jpg'],
        'لپ تاپ 14.2 اینچی اپل مدل مک بوک ایر پرو یک ترابایت',
        'Apple MacBook Air XGB RAM GB SSD Laptop',
        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
        '"رنگ"=>"سبز", "برند"=>"اپل", "دسته بندی"=>"موبایل", "اقلام همراه"=>"شارژر"',
        10200000,
        null,
        21
    );

insert into hero_sliders(url, image, priority) values
  ('/explore?x=1', '/images/routes/home/hero-slider-1.png', 1),
  ('/explore?x=2', '/images/routes/home/hero-slider-2.png', 2),
  ('/explore?x=3', '/images/routes/home/hero-slider-3.png', 3),
  ('/explore?x=4', '/images/routes/home/hero-slider-4.png', 4),
  ('/explore?x=5', '/images/routes/home/hero-slider-5.png', 5);
