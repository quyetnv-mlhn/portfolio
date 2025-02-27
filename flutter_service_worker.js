'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"index.html": "92c50367ae9a109beb202e7bf50eb6ce",
"/": "92c50367ae9a109beb202e7bf50eb6ce",
"assets/NOTICES": "2055241d0473ce26b4d813ea74de7201",
"assets/assets/images/banner.png": "d7663d07e733792907f0421c2225f959",
"assets/assets/images/chill.png": "ffbb1cbdbccee38805d4a358013cb133",
"assets/assets/images/speech_bubble.png": "8d74eb10ee9cf71f6504111dbee8f855",
"assets/assets/images/banner3.png": "2ad3145347ad38ba7ee276c68382c620",
"assets/assets/images/avatar.jpeg": "7cf9469bc09975d20f27e483837d1cf9",
"assets/assets/images/avatar.png": "ac0b0791ab539bf4f63a2aea564d53c9",
"assets/assets/images/banner1.png": "a914e8db4eb9160173de9f3da5ab9197",
"assets/assets/images/banner2.png": "cc45df1d9fe6349a85870e060f5d0d4e",
"assets/assets/icons/arrow.svg": "f95301bdfbdbdfad9b3651aabac0055a",
"assets/assets/icons/facebook.svg": "46fb97339cc1309e5a6552c971c974ed",
"assets/assets/icons/telegram.svg": "12d0db20b4f36fab0c71ab5378d00165",
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
"assets/assets/translations/vi-VN.json": "8c24b6fc32246dedbba61054baff5dc9",
"assets/assets/translations/en-US.json": "c29cf1792d2b30b91661899771550f82",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3e0523a48906d20a7650b97177b914b5",
"assets/fonts/MaterialIcons-Regular.otf": "fa2349c7394c34e0011e9e60440f7de0",
"assets/FontManifest.json": "d6214f42b45fa3a325b8efe6ba214026",
"assets/AssetManifest.bin.json": "11a26bbc9d4dfcb5c8fc2e3a481a9f70",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "1b6d24d3741f6e3f561ffb3b2f2543c4",
"version.json": "009c9e65172e010890f7f65fde438006",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"main.dart.js": "b4538dd8574b115d5c3ac04c7ccc932e",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "bff7290d9c190c999f8677acb19b48a5"};
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
