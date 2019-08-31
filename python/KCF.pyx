from cvt cimport *
from libcpp cimport bool

#cdef extern from "../src/kcftracker.hpp":
#	cdef cppclass KCFTracker:
#		KCFTracker(bool, bool, bool, bool)
#		void init(Rect, Mat)
#		Rect update(Mat)

cdef extern from "./ptrtracker.cpp":
	cdef cppclass PtrTracker:
		pass
	cppclass Tracker:
		bool init(Mat, Rect2d)
		bool update(Mat, Rect2d)	

cdef extern from "opencv2/tracking.hpp" namespace "cv":
#	cdef cppclass Tracker:
#		pass
	cdef cppclass TrackerKCF:
		@staticmethod
		Tracker create()
		
cdef class kcftracker:
	cdef Tracker *classptr
	
	def __cinit__(self, hog, fixed_window, multiscale, lab):
		self.classptr = TrackerKCF.create()
	
	def __dealloc__(self):
		del self.classptr
		
	def init(self, ary, rectlist):
		return self.classptr.init(nparray2cvmat(ary), pylist2cvrect(rectlist))
		
	def update(self, ary, rectlist):
		rect = pylist2cvrect(rectlist)
		result = self.classptr.update(nparray2cvmat(ary), rect)
		return result, cvrect2pylist(rect)

