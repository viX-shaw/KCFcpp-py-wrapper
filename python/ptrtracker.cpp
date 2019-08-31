#include "ptrtracker.hpp"

KCFT::KCFT()
{
  tracker = TrackerKCF::create()
}

bool KCFT::init(cv::Mat img, cv::Rect2d &box)
{
  return tracker->init(img, box)
}

bool KCFT::update(cv::Mat img, cv::Rect2d &box)
{
  return tracker->update(img, box)
}