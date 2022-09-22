<?php

namespace App\Http\Controllers;

use Google_Client;
use Google_Service_YouTubeReporting;

class ReportTypeController extends Controller
{
    public function index()
    {
        $client = new Google_Client();
        $client->setAccessToken(config('youtube.token'));

        $youtubeReporting = new Google_Service_YouTubeReporting($client);
        $reportTypes = $youtubeReporting->reportTypes->listReportTypes();

        return response()->json($reportTypes->reportTypes);
    }
}
