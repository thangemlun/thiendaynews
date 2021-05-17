package com.thienday.paging;

public interface Pageable {
	Integer getPage();
	Integer getOffSet();
	Integer getLimit();
	Sorter getSorter();
}
