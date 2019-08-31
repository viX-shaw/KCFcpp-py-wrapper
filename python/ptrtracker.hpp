#include <opencv2/core/cvstd.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/tracking.hpp>


// typedef Ptr<Tracker> PtrTracker;

class KCFT
{
public:
    KCFT();
    virtual bool init(Mat img, Rect2d &box);
    virtual bool update(Mat img, Rect2d &box);

    cv::Ptr<cv::Tracker> tracker;

}
