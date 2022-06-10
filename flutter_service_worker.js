'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "2866984f309e98828c0d22f63086eb46",
".git/config": "fadf21f16deb9baed9c3900687fb0b71",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "01b1688f97f94776baae85d77b06048b",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "81005745454846bb79cc3c7c0c57658d",
".git/hooks/prepare-commit-msg.sample": "7dfe15854212a30f346da5255c1d794b",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "7e868a1f53361e79c6dcb77f8bad3803",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "74c6cd5df93bf8e93dc875d039988230",
".git/logs/refs/heads/gh-pages": "74c6cd5df93bf8e93dc875d039988230",
".git/logs/refs/remotes/origin/gh-pages": "c0a6d77d8a215d165bdb287448e02deb",
".git/objects/01/ac196546c0d6a44975673409026f43b9c666ed": "2961ec0f8ebabb7d933df0716174f980",
".git/objects/02/0f5e56a927a04113ecb38d06238b0c2998ee52": "b74ec5f14b7d6eaa207cddb2b632edf0",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/08/42590542f91e3c85454c67ad24f0e32ec901fd": "a992844c18243a4232e6d2fc91a875f0",
".git/objects/09/80d6abebb88c9ca1add8130426da04009dff65": "5005adec977bbfabe04a183c603de518",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/0d/70b0c4179c635121aa52ab25425867cdd6b7fd": "7ab8c2bcce703429f242e0a30e5dfc7a",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/21/5fca5f5fb648f8f778a16016627377c028f97b": "a32ccdec378852825c7933aa6fe808d3",
".git/objects/21/c2e858d945cc4e7535384b79e94d565b81a9e8": "2af2883b6e8b984e706c449d863540e1",
".git/objects/22/8c7d48d068ac12f7a573fbcef3109e71473c59": "892827600f361ef08141f911c01414aa",
".git/objects/23/d18682222e196bd636f94dcc423e7b0b7dcf93": "36e2dd1fa5a848d668bc1af3e1b59802",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/29/fa4512f21b61564761df5585a11be1cc985476": "decc5e942c917e8ed7ad81ac82d3f283",
".git/objects/2a/331dec801a0da0640d4ff3205ba759c0f04cbb": "aa7a61d45f39c1172fda01f63b609e42",
".git/objects/2d/864f7eea8a99e67f2dc3582f8b0fdb09d09aef": "16fce1e42bce386101bddc202bea224b",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/2d/fc67d54e5891665268098528b75411a7a4f7a7": "5f4af981c971163c52931d6be064e6c1",
".git/objects/33/0a203c65d38e8d9f151c68b10b6b2bfbcc7db1": "cf52c3d2c5307260eab348f34ea58d78",
".git/objects/33/e95a31d4e73ea46d639770da2d9bab37a93632": "3eac8276bbc5a72d1ab329279f46d486",
".git/objects/42/10982c927052b71481d79fb032183c93bd5703": "1559760eb49dd308e2e9c63ae622cffb",
".git/objects/49/65532af57841d4b1db2bc298f22701901a7120": "a96c1fba4b2429f56c9c71f19d20ba12",
".git/objects/4c/a54acfb7c34d6d66a7a016e7cbd8bad1771edd": "4cfe5f7c2313f3261c82f5cbcc4225b6",
".git/objects/4d/f1eb433d14722f7b13f4e7b6e4e4476b5e7d73": "aa5787fd50edfac4fcf605152b390478",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/4f/de0fd43dc409242d5b743f5df62f1c5769f9e2": "6303cae9cd146f0f65ee31a207f4d2b9",
".git/objects/56/305710333c648a3368d3696f5493c1d79eb345": "7765812b8059784cc126400fabf246cb",
".git/objects/56/a0276d0ff8200aff74bb305400d74ca8380012": "777dae569c3e7cb2abf51c0477517abf",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/77/64ef58bd06db68e176fc74e3093454dbb0e5b9": "765b22a6f771180a5f7a76fd10c2f6a0",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7c/b2aee19678ff6e2428cdebdd9a910584d8874a": "88f87480113ecbf191fce503b58f2136",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/8c/68234136268796b8babf6587b52d7602f80c29": "cd514e0dc2fd19567ab19fb9404497b5",
".git/objects/8c/e21572c2a95e8f08723740bf8958ca22856d06": "6a729c185243683c1cacb7df01a01fea",
".git/objects/8e/e1b73b144b7ce81063dda5152dd074125fe62a": "9f2d15740abef9faa0187685e430a7f7",
".git/objects/8f/23780e69384f6573f4cf966d9f82178e2adea0": "695a4a7093f7f8535b5ded39021fb779",
".git/objects/90/2d682446974f17cab87bb19b253b0bbe9d95da": "3132ffb71973b4c2ac74b261066f5381",
".git/objects/9a/bc1af2d69a90e11870af7df9beabd5c1805538": "53905333b4ed19f55cdc6b4f761751f4",
".git/objects/a0/3c429739e0e02418277696fb6ce8ecce4b8e72": "eba365bd31b1b73ff84c7a5d81e79a7f",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/af/d1800147cc2c8e61b87d12f1a4edf3fef9b9fa": "85681e2cb726ff7aea68d098e567647d",
".git/objects/b3/73189590ae8e5496d851f79e688a5dd6b3222b": "37d78ec17eb31356e021fb1edb18b581",
".git/objects/b4/fa32f61d38dd5604d85311aa8d02ddc348710e": "71f64d3373ee7100aa4460cfc3c63852",
".git/objects/b9/90d98b08463c92f5a2cd95155da686e23d4ff1": "68208faca8bd4724651ad0ff44dd693d",
".git/objects/c5/0eb45511c4d42f9430c191bd7551f675bd737f": "bd7e173ae4fbd1e807b171c9c4ef7d50",
".git/objects/c8/d4bacb560cefed9e8e5b95851d42ecb265214b": "357af95fd3979bd9a17402016a6ee535",
".git/objects/cd/63e229bc377aac4b41a52bb45f7a0db664671b": "2da89711df93c0d9943fa6f78fd7de85",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/d4/fa20bcf2d3b0e1a599e7ee065234f870595087": "b8f35f7e5eb49e686eded13657bebac6",
".git/objects/d6/986847981bf5548c4faef056e234612da06baa": "ab3670cda1364605190879822f29c98c",
".git/objects/d6/f456386600130c6613661478fc808613b6cb0e": "e9ce1ccdc1762767ed99745de1ca702a",
".git/objects/d8/8b48342fa83df49ea3b1cc737b5854d2c93cca": "2fc55cf68597ab84c6ebf4be427a5be2",
".git/objects/d9/c5a94d3e706e70d6c75a8a4a95f3f9fde2d076": "37203a122a375f1d2dc8f34ebbfde215",
".git/objects/dd/6b31817b4d9098d204c762a04f948125faa4a8": "2bb88de1575e32116af407ea3b3d10f5",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/56ce3e1748ece01aefc456d0923fdf5adcd16c": "5da64b397f19207ca8e3c7e018128177",
".git/objects/e5/397ed16364318ac2ae8b16192d917d58ed60c4": "5fb5e7d5a390055a5e93283f57ae6037",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e8/5c1b645af6fabc645f7b82d4753ecd42d7bc8b": "d751de1b92d635e53bdc454f1066118b",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/ee/ac10dfa529b5408cac8a5ff65b3230e51050d3": "906cd87e1b288ba05661a17266c5f75a",
".git/objects/f0/a4cf1a2504963bb2cc1d5f2702438244ea286d": "bb51116ea416ee3ab27efa16e4c98e1e",
".git/objects/f6/15526343b477f7426bb92b30f64de975423de0": "ca6e350ac975daf14f027ce7e3ec8660",
".git/objects/fd/e58f4b0553bdefc3e37a783b31e5fb4f87bc1a": "1f99d568925a498c047bae0efe217b18",
".git/refs/heads/gh-pages": "1fc0add4217d9e40b389f16ecac0b0d9",
".git/refs/remotes/origin/gh-pages": "1fc0add4217d9e40b389f16ecac0b0d9",
"assets/AssetManifest.json": "b6eef433fa318d9d9363bbfcfbd7de46",
"assets/data/ksubwayApi/demo.json": "544d877d8c6f472cdd2f4b874ff0ed49",
"assets/FontManifest.json": "df43d92f6a8861d716dfb4fe1ef812f4",
"assets/fonts/GimpoGothicBold.otf": "7632b47474660d443e08900b88f145df",
"assets/fonts/GimpoGothicRegular.otf": "e4451a4712c99760406c7df1918f6d23",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "b78d858cd23c5d6d36c3df1eaf179b7b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "dcb39ae7d606895913d386c09ed00792",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/Icon-192.png": "c6057fa739630e47794acaf3992dd39b",
"icons/Icon-512.png": "9b53b190f117b8eb4ea956486dff923a",
"icons/Icon-maskable-192.png": "c6057fa739630e47794acaf3992dd39b",
"icons/Icon-maskable-512.png": "9b53b190f117b8eb4ea956486dff923a",
"index.html": "055796f18761c76762676938795c3cd6",
"/": "055796f18761c76762676938795c3cd6",
"main.dart.js": "ca727014e13e38c66ca3d12882663bfe",
"manifest.json": "e6b05f3a6e9d29a496df287b9e8ae611",
"version.json": "9e7bdfa447bd3244620fd322c9c1a7cd"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
