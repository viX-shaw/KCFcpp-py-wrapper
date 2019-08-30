from cvt cimport *
from libcpp cimport bool

cdef extern from "../src/kcftracker.hpp":
	cdef cppclass KCFTracker:
		KCFTracker(bool, bool, bool, bool)
		void init(Rect, Mat)
		Rect update(Mat)

cdef extern from "./ptrtracker.hpp":
	cdef cppclass PtrTracker:
		pass

cdef extern from "opencv2/core/cvstd.hpp" namespace "cv":
	cdef cppclass Ptr:
		Ptr()

cdef extern from "opencv2/tracking.hpp" namespace "cv":
	cdef cppclass Tracker:
		pass
	cdef cppclass TrackerKCF:
		Tracker create()
		bool init(Mat, Rect)
		bool update(Mat, Rect)	
		
cdef class kcftracker:
	cdef KCFTracker *classptr
	
	def __cinit__(self, hog, fixed_window, multiscale, lab):
		self.classptr = new KCFTracker(hog, fixed_window, multiscale, lab)
		
	def __dealloc(self):
		del self.classptr
		
	def init(self, rectlist, ary):
		self.classptr.init(pylist2cvrect(rectlist), nparray2cvmat(ary))
		
	def update(self, ary):
		rect = self.classptr.update(nparray2cvmat(ary))
		return cvrect2pylist(rect)

