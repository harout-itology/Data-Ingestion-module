<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\YouTubeReportingService;
use Google\Service\Exception;

class YouTubeJobController extends Controller
{
    public function __construct(public YouTubeReportingService $youTubeService)
    {
    }

    public function index()
    {
        return response()->json($this->youTubeService->getJobs()->jobs);
    }

    public function store()
    {
        $reportTypes =  $this->youTubeService->getReportTypes()->reportTypes;

        $jobCreateResponse = [];
        foreach ($reportTypes as $reportType) {
            try{
                $jobCreateResponse[] = $this->youTubeService->setJob($reportType->id, $reportType->name);
            } catch(Exception $e){
                $error = $e->getErrors()[0];
                $error['name'] = $reportType->name;
                $jobCreateResponse[] = $error;
            }
        }

        return response()->json($jobCreateResponse);
    }
}
