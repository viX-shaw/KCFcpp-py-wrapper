#include "ptrtracker.hpp"

KCFT::KCFT()
{
  tracker = cv::TrackerKCF::create();
}

KCFT::~KCFT()
{
  tracker = NULL;
}

bool KCFT::init(cv::Mat img, const cv::Rect &box)
{
  return tracker->init(img, box);
}

bool KCFT::update(cv::Mat img, const cv::Rect &box)
{
  return tracker->update(img, box);
}