<?php

namespace App\Http\Controllers;

use Alaouy\Youtube\Facades\Youtube;
use App\Http\Controllers\Controller;
use App\Models\YoutubeVideoMapping;

class YouTubeVideoController extends Controller
{
    /*
     * get the video_id
     * return ['video_title', 'channel_id', 'channel_title'] / 'youtube_video_mappings'
     */
    public function show($id)
    {
        $video =  Youtube::getVideoInfo($id);

        if (!isset($video->id)) {
            return response()->json('Youtube video not found', 404);
        }

        YoutubeVideoMapping::firstOrCreate(
            ['video_id' => $id],
            [
                'video_id' => $video->id,
                'video_title' => $video->snippet->title,
                'channel_id' => $video->snippet->channelId,
                'channel_title' => $video->snippet->channelTitle,
            ]
        );

        return response()->json($video);
    }
}
