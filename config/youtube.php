<?php

/*
|--------------------------------------------------------------------------
| Laravel PHP Facade/Wrapper for the Youtube Data API v3
|--------------------------------------------------------------------------
|
| Here is where you can set your key for Youtube API. In case you do not
| have it, it can be acquired from: https://console.developers.google.com
*/

return [
    'id' => env('YOUTUBE_CLIENT_ID'),
    'secret' => env('YOUTUBE_CLIENT_SECRET'),
    'key' => env('YOUTUBE_API_KEY'),
    'redirect' => env('YOUTUBE_REDIRECT_URL'),
    'token' => env('YOUTUBE_TOKEN'),
    'scopes' => [
        'https://www.googleapis.com/auth/yt-analytics.readonly',
        'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
        'https://www.googleapis.com/auth/youtube',
        'https://www.googleapis.com/auth/youtubepartner',
    ]
];
