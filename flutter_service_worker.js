'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"index.html": "92c50367ae9a109beb202e7bf50eb6ce",
"/": "92c50367ae9a109beb202e7bf50eb6ce",
"assets/NOTICES": "2cbd379a15667f17688c183f911c1244",
"assets/assets/images/banner.png": "d7663d07e733792907f0421c2225f959",
"assets/assets/images/chill.png": "ffbb1cbdbccee38805d4a358013cb133",
"assets/assets/images/BHSoft_logo.png": "073896849999190806f3075cb5f12501",
"assets/assets/images/speech_bubble.png": "8d74eb10ee9cf71f6504111dbee8f855",
"assets/assets/images/university_logo.png": "d33812d6433b838f8d0f44c71287e89a",
"assets/assets/images/banner3.png": "2ad3145347ad38ba7ee276c68382c620",
"assets/assets/images/avatar.jpeg": "7cf9469bc09975d20f27e483837d1cf9",
"assets/assets/images/avatar.png": "ac0b0791ab539bf4f63a2aea564d53c9",
"assets/assets/images/banner1.png": "a914e8db4eb9160173de9f3da5ab9197",
"assets/assets/images/self_project.png": "c224b93234304ce21f607f569c2f8f74",
"assets/assets/images/banner2.png": "cc45df1d9fe6349a85870e060f5d0d4e",
"assets/assets/icons/arrow.svg": "f95301bdfbdbdfad9b3651aabac0055a",
"assets/assets/icons/facebook.svg": "46fb97339cc1309e5a6552c971c974ed",
"assets/assets/icons/telegram.svg": "12d0db20b4f36fab0c71ab5378d00165",
"assets/assets/icons/techs/azure.svg": "d36fd641289fea2948d94eb4418ba412",
"assets/assets/icons/techs/android.svg": "53507b2b9acfa23da1f3cdc317e9bc5f",
"assets/assets/icons/techs/dart.svg": "20d7b82998ddc6f73a4310bf58e609df",
"assets/assets/icons/techs/javascript.svg": "b4bcb3da1104cf9cfd13fd8dd115d12b",
"assets/assets/icons/techs/firebase.svg": "ee0673bd472cfcc1256a65fe438837b3",
"assets/assets/icons/techs/nextjs.svg": "47a99732c517be2db31468f881d3e7ec",
"assets/assets/icons/techs/self.png": "c224b93234304ce21f607f569c2f8f74",
"assets/assets/icons/techs/database.svg": "21dfa8fc099acbb4720c5af356864bb4",
"assets/assets/icons/techs/odoo.svg": "504455a53641ff75ea88b92d7b22c3b2",
"assets/assets/icons/techs/figma.svg": "fd9589e615f681335da7a2c8b6d07075",
"assets/assets/icons/techs/ios.svg": "7179728dda9645ae9ac4e3075c3bab1c",
"assets/assets/icons/techs/github.svg": "4d56b3683c48ed7c70e76b81fb262a4a",
"assets/assets/icons/techs/aws.svg": "f38192fa4ff06ac1b3c3854133b8b414",
"assets/assets/icons/techs/nodejs.svg": "e4ddbe1a57d161bfb593c7e2ba40d345",
"assets/assets/icons/techs/swift.svg": "692251bb8b34bdddbfd58a267e98310a",
"assets/assets/icons/techs/flutter.svg": "0729a6084a22547bf3506ddce68380cd",
"assets/assets/icons/techs/php.svg": "ad9433ef1d43e780fab2096697cd4b74",
"assets/assets/icons/techs/python.svg": "c90769011d611cbbcada467367c3b263",
"assets/assets/icons/techs/react.svg": "254c6dca4a88ae3fc0294063ee028be1",
"assets/assets/icons/linkedin.svg": "b00fc9107ddabb90b6c45d523eb58af5",
"assets/assets/icons/brightness.svg": "63bed0b0226b917049301d0c1f5cca88",
"assets/assets/icons/github.svg": "48cadeb83e771872f7adcd16001601da",
"assets/assets/icons/house-night.svg": "c0a0793b45d7e8ee5ad9a0ea030c7430",
"assets/assets/fonts/Mali/Mali-Bold.ttf": "65580d7de3378dc2eec40515e69eba64",
"assets/assets/fonts/Mali/Mali-Regular.ttf": "f90744ee422886829a848c45277bf99b",
"assets/assets/fonts/Mali/Mali-SemiBold.ttf": "24182c39b8c44bb4811a34bb7222b484",
"assets/assets/fonts/Mali/OFL.txt": "8c437cc12f75f7feca2bae290e47e967",
"assets/assets/fonts/Mali/Mali-Light.ttf": "bb99e4989f3fdf8fe204e9f3a8aacdf4",
"assets/assets/fonts/Mali/Mali-Medium.ttf": "bdad20cfc7e404521a8cfd85c8b57513",
"assets/assets/fonts/Mali/Mali-ExtraLight.ttf": "8090dd063c5b54a936dc4aa2b357e2ee",
"assets/assets/fonts/Mali/Mali-SemiBoldItalic.ttf": "08ece66b5f2ed2d629563db1e4848173",
"assets/assets/fonts/Mali/Mali-MediumItalic.ttf": "fd1f4604927f7aea99b77f9ad476e854",
"assets/assets/fonts/Mali/Mali-BoldItalic.ttf": "8ebe2e42d0ecfdcc269c58cfcf97fdce",
"assets/assets/fonts/Mali/Mali-LightItalic.ttf": "ba4860d16aab77e9702e8569f9b5de14",
"assets/assets/fonts/Mali/Mali-ExtraLightItalic.ttf": "b0ea3dee29e7045009e528dd72ae5203",
"assets/assets/fonts/Mali/Mali-Italic.ttf": "a27f85e7a1e18ff38c75697a5858506e",
"assets/assets/translations/vi-VN.json": "8ff9a902dbc104a5fa5707c000f8c230",
"assets/assets/translations/en-US.json": "9d0e4113b0a22455147cfe7d292c1633",
"assets/assets/data/home/home_en.json": "c6733f223ac3dadbbe5711e5ff592878",
"assets/assets/data/home/home_vi.json": "8d960eb05c16d8c29472278dc16e7a3e",
"assets/assets/data/about_me/about_me_en.json": "0723c8c338953710e9c3fbb505c0617e",
"assets/assets/data/about_me/about_me_vi.json": "963f4654b02023de7282b3de9657d7b0",
"assets/assets/data/base/personal_info.json": "838e9d1940bb3cbad8d45a3d9848d5c7",
"assets/assets/data/experiences/experience_vi.json": "2a7b9daf8281ca00f4aa94b8debb6eaa",
"assets/assets/data/experiences/experience_en.json": "86b1fe6e2cb16abaf1ae1c509ece2426",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c6458744160422c4868d825f9a91374e",
"assets/fonts/MaterialIcons-Regular.otf": "442077ad690c95ddea99c347ff0dd82b",
"assets/FontManifest.json": "d6214f42b45fa3a325b8efe6ba214026",
"assets/AssetManifest.bin.json": "106c4dce0655dfe314b5a3032ca03879",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.json": "f2141233e3a7cb1adec0acdc20b30a6c",
"version.json": "009c9e65172e010890f7f65fde438006",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"main.dart.js": "a6c8facd64b17fad778889385cf97cad",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "ebfc322d6d1b6ef4c0aa8fa377d4aa19"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
