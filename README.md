#chungphuoc - shop2market assignment 1
** The Assignment:
Write a program that crawls a given website (up to 3 levels deep, maximum 50
pages) and counts all input elements (<input...) per page. The counts per
page are for the inputs on that page plus all the inputs of the pages it refers to.

Performance is a key factor so do a few optimizations for performance, like
concurrent processing of the web pages.

Don't use a gem like Anemone for this, write your own crawling functions.

Provide:
- Tests

- A command line runnable class that crawls a website

Acceptance criteria:

Input: url_of_website

Output example:

home.html - 20 inputs

contact.html - 5 inputs

products.html - 10 inputs

faq.html - 5 inputs

** Require gems: (You can found in the Gemfile)
  - ruby
  - nokogiri
  - rspec
  - simplecov

** Run the program:
  - Simply run the command: ruby program.rb and provide the url you want to crawl in the command line.

** Implement:

  - I am using open-uri to open the url, nokogiri to parse the html of the website.
  - I have created a crawler class that will initialized with the url it need to crawl. Also have 2 public methods for checking the url link for crawler and print the results output.
  - The crawler will crawl the given website url and find more link url inside that website and count for the input tag on each page. The program will stop when run through all the links or reach 50 limit links, and the website has been crawled for 3 levels.

** Testing
  - I use rspec for testing all the action in crawler file. to run it you run the command "rspec spec/"

** Sample
  - Here are the sample results when I run crawler for the famous online news paper in Vietnam (http://tuoitre.vn)
If you do not input the url on console. the crawler will run crawl with defaul url is: http://shop2market.com

***ruby program.rb

Please input the url you want to crawl:

http://tuoitre.vn/

Crawling : http://tuoitre.vn/ & child pages are in process. Please wait...

Results: Found 51 page(s)

http://tuoitre.vn/ - 202 inputs

http://tuoitre.vn/tin/tuoi-tre-cuoi-tuan/van-de-su-kien - 4 inputs

http://tuoitre.vn/tin/tuoi-tre-cuoi-tuan - 4 inputs

http://tuoitre.vn/tin/chinh-tri-xa-hoi/thoi-su-suy-nghi - 4 inputs

http://tuoitre.vn/tin/chinh-tri-xa-hoi - 4 inputs

http://tuoitre.vn/tin/chinh-tri-xa-hoi/moi-truong - 4 inputs

http://tuoitre.vn/tin/chinh-tri-xa-hoi/phong-su-ky-su - 4 inputs

http://tuoitre.vn/tin/ban-doc/tieu-diem - 4 inputs

http://tuoitre.vn/tin/chinh-tri-xa-hoi/chuyen-thuong-ngay - 4 inputs

http://tuoitre.vn/tin/the-gioi/quan-sat-binh-luan - 4 inputs

http://tuoitre.vn/tin/the-gioi - 4 inputs

http://tuoitre.vn/tin/the-gioi/nguoi-viet-nam-chau - 4 inputs

http://tuoitre.vn/tin/the-gioi/the-gioi-muon-mau - 4 inputs

http://tuoitre.vn/tin/the-gioi/goc-anh - 4 inputs

http://tuoitre.vn/tin/the-gioi/ho-so - 4 inputs

http://tuoitre.vn/tin/phap-luat/ky-su-phap-dinh - 4 inputs

http://tuoitre.vn/tin/phap-luat - 4 inputs

http://tuoitre.vn/tin/kinh-te - 4 inputs

http://tuoitre.vn/tin/phap-luat/tu-van - 4 inputs

http://tuoitre.vn/tin/kinh-te/tai-chinh - 4 inputs

http://tuoitre.vn/tin/kinh-te/thi-truong - 4 inputs

http://tuoitre.vn/tin/kinh-te/the-gioi-xe - 4 inputs

http://tuoitre.vn/tin/kinh-te/doanh-nhan - 4 inputs

http://tuoitre.vn/tin/song-khoe/phong-mach-online - 4 inputs

http://tuoitre.vn/tin/song-khoe - 4 inputs

http://tuoitre.vn/tin/song-khoe/gioi-tinh - 4 inputs

http://tuoitre.vn/tin/song-khoe/me-va-be - 4 inputs

http://tuoitre.vn/tin/song-khoe/blog-bac-si - 4 inputs

http://tuoitre.vn/tin/song-khoe/tu-van-hiem-muon - 4 inputs

http://tuoitre.vn/tin/giao-duc/du-hoc - 4 inputs

http://tuoitre.vn/tin/giao-duc - 4 inputs

http://tuoitre.vn/tin/giao-duc/cau-chuyen-giao-duc - 4 inputs

http://tuoitre.vn/tin/giao-duc/khoa-hoc - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri - 4 inputs

http://tuoitre.vn/tin/giao-duc/giao-duc-cac-nuoc - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/am-nhac - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/giai-tri - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/thoi-trang - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/dien-anh - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/hau-truong - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/truyen-hinh - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/goc-anh - 4 inputs

http://tuoitre.vn/tin/van-hoa-giai-tri/van-hoc-sach - 4 inputs

http://tuoitre.vn/tin/nhip-song-tre/song-va-yeu - 4 inputs

http://tuoitre.vn/tin/nhip-song-tre - 4 inputs

http://tuoitre.vn/tin/nhip-song-tre/nhip-song-online - 4 inputs

http://tuoitre.vn/tin/nhip-song-tre/co-hoi-viec-lam - 4 inputs

http://tuoitre.vn/tin/ban-doc - 4 inputs

http://tuoitre.vn/tin/nhip-song-tre/bac-nhip-trai-tim - 4 inputs

http://tuoitre.vn/tin/ban-doc/phan-hoi - 4 inputs

http://tuoitre.vn/tin/ban-doc/cung-lam-bao - 4 inputs

***
