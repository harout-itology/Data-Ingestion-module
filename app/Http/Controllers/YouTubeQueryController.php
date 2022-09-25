<?php

namespace App\Http\Controllers;

use App\Services\YouTubeAnalyticsService;
use Illuminate\Http\Request;

class YouTubeQueryController extends Controller
{
    public function __construct(public YouTubeAnalyticsService $youTubeService)
    {
    }

    public function query()
    {
        $query = [
            'startDate' => '2020-09-25',
            'endDate' => '2022-09-25',
            'ids' => 'channel==UCZdIAbLH6tRCPzFhReCJuog',
            'metrics' => 'views,comments,likes,dislikes,estimatedMinutesWatched,averageViewDuration',
            'filters' => 'video==SIbGr3mGDNk;',
        ];

        return response()->json($this->youTubeService->query($query));
    }
}
