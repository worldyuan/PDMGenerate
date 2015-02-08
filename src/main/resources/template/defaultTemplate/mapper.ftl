<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${xml["packages"]["model"]}.${pdmT.code}Mapper">
    <insert id="insert" parameterType="${xml["packages"]["model"]}.${pdmT.code}" useGeneratedKeys="true" keyProperty="id">
        insert into ${pdmT.code}
        (<include refid="common.insertColumns"/>
        <if test="id !=null">
        	,id
        </if>
        <#list pdmT.columns as f>
        <#if f.code != "id">
        ,${f.code}
        </#if>
        </#list>)
        values
        (<include refid="common.insertValues"/>
        <if test="id !=null">
        	,${'#'}{id}
        </if>
        <#list pdmT.columns as f>
        <#if f.code != "id">
        	,${'#'}{${f.code}}
        </#if>
        </#list>
        )
    </insert>
    
    <select id="select" parameterType="map" resultType="${xml["packages"]["model"]}.${pdmT.code}">
        select * from ${pdmT.code}
        <where>
        	<include refid="common.condition"/>
            <include refid="condition"/>
            <include refid="andLikeCondition"/>
            <include refid="startLikeCondition"/>
        </where>
        <if test="orderBy==null and sortBy==null">
            order by id desc
        </if>
        <if test="orderBy!=null">
            order by ${'$'}{orderBy}
        </if>
        <if test="orderBy!=null and sortBy!=null">
            ${'$'}{sortBy}
        </if>
        <if test="beginRow==null or pageSize==null">
            limit 0,15
        </if>
        <if test="beginRow!=null and pageSize!=null">
            limit ${'#'}{beginRow},${'#'}{pageSize}
        </if>
    </select>
    
    <select id="distinct" parameterType="map" resultType="${xml["packages"]["model"]}.${pdmT.code}">
        select Distinct * from ${pdmT.code}
        <where>
        	<include refid="common.condition"/>
            <include refid="condition"/>
            <include refid="andLikeCondition"/>
            <include refid="startLikeCondition"/>
        </where>
        <if test="orderBy==null and sortBy==null">
            order by id desc
        </if>
        <if test="orderBy!=null">
            order by ${'$'}{orderBy}
        </if>
        <if test="orderBy!=null and sortBy!=null">
            ${'$'}{sortBy}
        </if>
        <if test="beginRow==null or pageSize==null">
            limit 0,10
        </if>
        <if test="beginRow!=null and pageSize!=null">
            limit ${'#'}{beginRow},${'#'}{pageSize}
        </if>
    </select>
    
    <select id="count" parameterType="map" resultType="int">
        select count(0) from ${pdmT.code}
        <where>
        	<include refid="common.condition"/>
            <include refid="condition"/>
            <include refid="andLikeCondition"/>
            <include refid="startLikeCondition"/>
        </where>
    </select>
    
    <select id="fetch" parameterType="int" resultType="${xml["packages"]["model"]}.${pdmT.code}">
        select * from ${pdmT.code}
        <where>
            <if test="id != null">id=${'#'}{id}</if>
            <include refid="common.condition"/>
            <include refid="condition"/>
        </where>
    </select>
    
    <delete id="deleteByCondition" parameterType="map">
        delete from ${pdmT.code}
        <where>
        	<if test="id != null">id=${'#'}{id}</if>
        	<include refid="common.condition"/>
            <include refid="condition"/>
        </where>
    </delete>
    
    <delete id="deleteAll" parameterType="java.lang.String">
		delete from ${pdmT.code} where id in
		<foreach item="idItem" collection="array" open="(" separator="," close=")">
			${'#'}{idItem}
		</foreach>
	</delete>
    
    <update id="update" parameterType="${xml["packages"]["model"]}.${pdmT.code}">
        update ${pdmT.code}
        <set>
            <#list pdmT.columns as f>
            <#if f.code != "id">
            <if test="${f.code} !=null">
                ${f.code} = ${'#'}{${f.code}},
            </if>
            </#if>
            </#list>
            <include refid="common.update"/>
        </set>
        where id = ${'#'}{id}
    </update>
    
    <update id="updateAll" parameterType="java.lang.String">
		update ${pdmT.code} 
		<set>
			<#list pdmT.columns as f>
			<#if f.code != "id">
            <if test="${f.code} !=null">
                    ${f.code} = ${'#'}{${f.code}},
            </if>
            </#if>
            </#list>
			<include refid="common.update"/>
        </set>
		where id in
		<foreach item="idItem" collection="ids" open="(" separator="," close=")">
			${'#'}{idItem}
		</foreach>
	</update>
	
	<update id="setNull" parameterType="map">
        update ${pdmT.code}
        <set>${'$'}{tableField} = null</set>
        <where>
            <if test="id!=null">id = ${'#'}{id}</if>
            <include refid="common.condition"/>
            <include refid="condition"/>
        </where>
    </update>
    
    <select id="maxInt" parameterType="map" resultType="int">
        select max(${'$'}{tableField}) from ${pdmT.code}
        <where>
        	<include refid="common.condition"/>
            <include refid="condition"/>
            <include refid="andLikeCondition"/>
        </where>
    </select>
    
    <sql id="condition">
        <#list pdmT.columns as f>
            <if test="${f.code} !=null">
                and ${f.code} = ${'#'}{${f.code}}
            </if>
        </#list>
    </sql>
    
    <sql id="andLikeCondition">
        <#list pdmT.columns as f>
        <#if f.type == "String">
            <if test="andLike${f.code ? cap_first}!=null and andLike${f.code ? cap_first}!=''">
                and ${f.code} like CONCAT(CONCAT('%',${'#'}{andLike${f.code ? cap_first}}),'%')
            </if>
        </#if>
        </#list>
    </sql>
    
    <sql id="startLikeCondition">
        <#list pdmT.columns as f>
        <#if f.type == "String">
            <if test="startLike${f.code ? cap_first}!=null and startLike${f.code ? cap_first}!=''">
                and ${f.code} like CONCAT(CONCAT(${'#'}{startLike${f.code ? cap_first}}),'%')
            </if>
        </#if>
        </#list>
    </sql>
</mapper>