importScripts(
  "https://storage.googleapis.com/workbox-cdn/releases/3.6.1/workbox-sw.js"
);

workbox.routing.registerRoute(
  new RegExp(".*.js"),
  workbox.strategies.networkFirst({
    networkTimeoutSeconds: 3
  })
);

workbox.routing.registerRoute(
  // Cache image files
  /.*\.(?:png|jpg|jpeg|svg|gif)/,
  // Use the cache if it's available
  workbox.strategies.cacheFirst({
    // Use a custom cache name
    cacheName: "image-cache",
    plugins: [
      new workbox.expiration.Plugin({
        // Cache only 20 images
        maxEntries: 20,
        // Cache for a maximum of a week
        maxAgeSeconds: 7 * 24 * 60 * 60
      })
    ]
  })
);

workbox.routing.registerRoute(
  /^https:\/\/fonts\.googleapis\.com/,
  workbox.strategies.cacheFirst({
    cacheName: "google-fonts-stylesheets"
  })
);

const runtimeCacheName = workbox.core.cacheNames.runtime;
self.addEventListener("install", event => {
  const urls = ["/"];
  event.waitUntil(
    caches.open(runtimeCacheName).then(cache => cache.addAll(urls))
  );
});

workbox.routing.registerNavigationRoute("/", { cacheName: runtimeCacheName });

workbox.skipWaiting();
workbox.clientsClaim();
