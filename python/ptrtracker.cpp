#include "ptrtracker.hpp"

KCFT::KCFT()
{
  tracker = cv::TrackerKCF::create();
}

KCFT::~KCFT()
{
  tracker = NULL;
}

bool KCFT::init(cv::Mat img, const cv::Rect2d& box)
{
  return tracker->init(img, box);
}

bbox KCFT::update(cv::Mat img, cv::Rect2d box)
{
  cv::Rect2d& b = box;
  bool res =  tracker->update(img, b);
  bbox *coords = (bbox *)malloc(sizeof(bbox));
  coords->success = res;
  coords->box = b;
  std::cout << res;
  std::cout << b;
  return coords;
}