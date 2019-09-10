from cvt cimport *
from libcpp cimport bool

#cdef extern from "../src/kcftracker.hpp":
#	cdef cppclass KCFTracker:
#		KCFTracker(bool, bool, bool, bool)
#		void init(Rect, Mat)
#		Rect update(Mat)

cdef extern from "./ptrtracker.hpp":
	cdef cppclass bbox:
		bool success
		Rect box
	cdef cppclass KCFT:
		KCFT()
		bool init(Mat, Rect)
		bbox update(Mat, Rect)	

#cdef extern from "opencv2/tracking.hpp" namespace "cv":
#	cdef cppclass Tracker:
#		bool init(Mat img, Rect box)
#		bool update(Mat img, Rect2d box)
#
#	cdef cppclass TrackerKCF:
#		@staticmethod
#		PtrTracker create()

cdef class kcftracker:
	cdef KCFT *classptr
	
	def __cinit__(self):
		self.classptr = new KCFT()

	def __dealloc__(self):
		del self.classptr
		
	def init(self, ary, rectlist):
		return self.classptr.init(nparray2cvmat(ary), pylist2cvrect(rectlist))
		
	def update(self, ary, rectlist):
		cdef Rect rect = pylist2cvrect(rectlist)
		cdef bbox result = self.classptr.update(nparray2cvmat(ary), rect)
		rect = result.box
		return result.success, cvrect2pylist(rect)

