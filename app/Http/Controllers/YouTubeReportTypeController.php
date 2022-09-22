<?php

namespace App\Http\Controllers;

use App\Services\YouTubeService;

class YouTubeReportTypeController extends Controller
{
    public function index(YouTubeService $youTubeService)
    {
        return response()->json($youTubeService->getReportTypes()->reportTypes);
    }
}
