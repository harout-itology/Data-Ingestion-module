<?php

namespace App\Http\Controllers;

use App\Services\YouTubeReportingService;

class YouTubeReportTypeController extends Controller
{
    public function index(YouTubeReportingService $youTubeService)
    {
        return response()->json($youTubeService->getReportTypes()->reportTypes);
    }
}
